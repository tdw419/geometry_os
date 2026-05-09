; DESCRIPTION: Draws a cyan line from (358, 21) to (378, 134).
; PLAN: r0=358(x1), r1=21(y1), r2=378(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 21
LDI r2, 378
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
