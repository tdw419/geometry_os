; DESCRIPTION: Draws a cyan line from (331, 72) to (151, 189).
; PLAN: r0=331(x1), r1=72(y1), r2=151(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 72
LDI r2, 151
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
