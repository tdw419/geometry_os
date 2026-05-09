; DESCRIPTION: Composite: Places a blue line segment connecting (415, 120) to (372, 41) then Sets a single cyan pixel at (30, 147).
; PLAN: r0=415(x1), r1=120(y1), r2=372(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=30(x), r6=147(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 120
LDI r2, 372
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 147
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
