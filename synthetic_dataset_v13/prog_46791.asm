; DESCRIPTION: Draws a green line from (427, 93) to (365, 210).
; PLAN: r0=427(x1), r1=93(y1), r2=365(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 93
LDI r2, 365
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
