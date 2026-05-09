; DESCRIPTION: Draws a green line from (394, 191) to (203, 156).
; PLAN: r0=394(x1), r1=191(y1), r2=203(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 191
LDI r2, 203
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
