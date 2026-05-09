; DESCRIPTION: Composite: Creates a red circular shape at (220, 188) with radius 25 then Renders a yellow line between points (104, 166) and (50, 219) then Places a purple 79x44 rectangle at position (211, 80).
; PLAN: r0=220(x), r1=188(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x1), r6=166(y1), r7=50(x2), r8=219(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=80(y), r12=79(width), r13=44(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 188
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 166
LDI r7, 50
LDI r8, 219
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 80
LDI r12, 79
LDI r13, 44
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
