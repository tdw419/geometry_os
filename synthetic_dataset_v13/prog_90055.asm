; DESCRIPTION: Draws a yellow line from (48, 48) to (272, 114).
; PLAN: r0=48(x1), r1=48(y1), r2=272(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 48
LDI r2, 272
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
