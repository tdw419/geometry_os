; DESCRIPTION: Composite: Renders a purple line between points (208, 121) and (237, 36) then Places a green dot at position (76, 237).
; PLAN: r0=208(x1), r1=121(y1), r2=237(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=237(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 121
LDI r2, 237
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 237
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
