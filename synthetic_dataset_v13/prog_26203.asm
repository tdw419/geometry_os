; DESCRIPTION: Composite: Draws a blue line from (23, 32) to (450, 20) then Draws a magenta circle centered at (444, 95) with radius 54.
; PLAN: r0=23(x1), r1=32(y1), r2=450(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=95(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 32
LDI r2, 450
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 95
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
