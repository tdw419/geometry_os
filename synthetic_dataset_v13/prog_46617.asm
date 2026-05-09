; DESCRIPTION: Composite: Draws a cyan line from (70, 185) to (450, 110) then Draws a orange circle centered at (288, 120) with radius 62.
; PLAN: r0=70(x1), r1=185(y1), r2=450(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=120(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 185
LDI r2, 450
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 120
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
