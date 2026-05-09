; DESCRIPTION: Draws a black line from (195, 151) to (362, 27).
; PLAN: r0=195(x1), r1=151(y1), r2=362(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 151
LDI r2, 362
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
