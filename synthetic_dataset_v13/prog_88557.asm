; DESCRIPTION: Draws a green line from (23, 236) to (365, 230).
; PLAN: r0=23(x1), r1=236(y1), r2=365(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 236
LDI r2, 365
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
