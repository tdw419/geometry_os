; DESCRIPTION: Draws a green line from (367, 76) to (213, 176).
; PLAN: r0=367(x1), r1=76(y1), r2=213(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 76
LDI r2, 213
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
