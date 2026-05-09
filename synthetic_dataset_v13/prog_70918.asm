; DESCRIPTION: Composite: Draws a purple line from (260, 238) to (237, 215) then Places a orange dot at position (382, 190).
; PLAN: r0=260(x1), r1=238(y1), r2=237(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=190(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 238
LDI r2, 237
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 190
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
