; DESCRIPTION: Draws a cyan line from (107, 92) to (358, 64).
; PLAN: r0=107(x1), r1=92(y1), r2=358(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 92
LDI r2, 358
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
