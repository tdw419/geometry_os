; DESCRIPTION: Composite: Draws a purple line from (357, 132) to (401, 197) then Places a blue dot at position (349, 95).
; PLAN: r0=357(x1), r1=132(y1), r2=401(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=95(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 132
LDI r2, 401
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 95
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
