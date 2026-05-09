; DESCRIPTION: Composite: Places a yellow dot at position (350, 170) then Places a blue line segment connecting (295, 70) to (442, 211).
; PLAN: r0=350(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=70(y1), r7=442(x2), r8=211(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 170
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 295
LDI r6, 70
LDI r7, 442
LDI r8, 211
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
