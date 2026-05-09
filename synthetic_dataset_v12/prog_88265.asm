; DESCRIPTION: Draws a green line from (358, 126) to (76, 60).
; PLAN: r0=358(x1), r1=126(y1), r2=76(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 126
LDI r2, 76
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
