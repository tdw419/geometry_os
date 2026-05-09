; DESCRIPTION: Composite: Renders a blue line between points (186, 89) and (485, 40) then Places a cyan dot at position (469, 16).
; PLAN: r0=186(x1), r1=89(y1), r2=485(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=16(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 89
LDI r2, 485
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 16
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
