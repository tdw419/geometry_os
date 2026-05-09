; DESCRIPTION: Composite: Creates a orange rectangular region at (253, 30) spanning 95 by 98 pixels then Draws a green line from (445, 16) to (218, 196) then Renders a red disk with center (223, 127) and radius 67.
; PLAN: r0=253(x), r1=30(y), r2=95(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x1), r6=16(y1), r7=218(x2), r8=196(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=127(y), r12=67(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 30
LDI r2, 95
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 16
LDI r7, 218
LDI r8, 196
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 127
LDI r12, 67
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
