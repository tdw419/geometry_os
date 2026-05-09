; DESCRIPTION: Draws a green line from (28, 23) to (365, 107).
; PLAN: r0=28(x1), r1=23(y1), r2=365(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 23
LDI r2, 365
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
