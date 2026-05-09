; DESCRIPTION: Draws a green line from (358, 7) to (340, 108).
; PLAN: r0=358(x1), r1=7(y1), r2=340(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 7
LDI r2, 340
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
