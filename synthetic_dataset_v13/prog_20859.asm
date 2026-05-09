; DESCRIPTION: Composite: Sets a single cyan pixel at (301, 210) then Places a blue line segment connecting (354, 20) to (101, 130).
; PLAN: r0=301(x), r1=210(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=354(x1), r6=20(y1), r7=101(x2), r8=130(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 210
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 354
LDI r6, 20
LDI r7, 101
LDI r8, 130
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
