; DESCRIPTION: Composite: Draws a purple line from (455, 215) to (160, 253) then Places a orange dot at position (307, 4).
; PLAN: r0=455(x1), r1=215(y1), r2=160(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=4(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 455
LDI r1, 215
LDI r2, 160
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 4
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
