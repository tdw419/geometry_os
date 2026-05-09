; DESCRIPTION: Composite: Places a red 77x39 rectangle at position (313, 99) then Places a magenta line segment connecting (415, 110) to (397, 15) then Renders a magenta disk with center (129, 50) and radius 32.
; PLAN: r0=313(x), r1=99(y), r2=77(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x1), r6=110(y1), r7=397(x2), r8=15(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=50(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 313
LDI r1, 99
LDI r2, 77
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 110
LDI r7, 397
LDI r8, 15
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 50
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
