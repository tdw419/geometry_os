; DESCRIPTION: Composite: Renders a green line between points (86, 68) and (381, 146) then Sets a single purple pixel at (446, 238).
; PLAN: r0=86(x1), r1=68(y1), r2=381(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=238(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 68
LDI r2, 381
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 238
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
