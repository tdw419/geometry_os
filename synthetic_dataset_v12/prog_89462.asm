; DESCRIPTION: Draws a cyan line from (358, 93) to (356, 252).
; PLAN: r0=358(x1), r1=93(y1), r2=356(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 93
LDI r2, 356
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
