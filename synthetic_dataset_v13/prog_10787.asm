; DESCRIPTION: Composite: Renders a orange line between points (435, 16) and (375, 110) then Places a green dot at position (299, 163).
; PLAN: r0=435(x1), r1=16(y1), r2=375(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=163(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 435
LDI r1, 16
LDI r2, 375
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 163
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
