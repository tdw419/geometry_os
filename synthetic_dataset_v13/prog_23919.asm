; DESCRIPTION: Composite: Draws a white line from (42, 188) to (158, 204) then Creates a cyan circular shape at (79, 155) with radius 12 then Renders a black box of size 20x87 starting at (186, 16).
; PLAN: r0=42(x1), r1=188(y1), r2=158(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=155(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x), r11=16(y), r12=20(width), r13=87(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 188
LDI r2, 158
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 155
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 16
LDI r12, 20
LDI r13, 87
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
