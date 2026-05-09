; DESCRIPTION: Composite: Places a purple line segment connecting (492, 37) to (295, 125) then Places a green dot at position (430, 29).
; PLAN: r0=492(x1), r1=37(y1), r2=295(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=29(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 492
LDI r1, 37
LDI r2, 295
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 29
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
