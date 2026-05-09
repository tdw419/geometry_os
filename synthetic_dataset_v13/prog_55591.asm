; DESCRIPTION: Draws a green line from (340, 48) to (99, 56).
; PLAN: r0=340(x1), r1=48(y1), r2=99(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 48
LDI r2, 99
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
