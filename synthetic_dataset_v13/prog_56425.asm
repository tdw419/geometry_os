; DESCRIPTION: Draws a black line from (212, 197) to (19, 213).
; PLAN: r0=212(x1), r1=197(y1), r2=19(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 197
LDI r2, 19
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
