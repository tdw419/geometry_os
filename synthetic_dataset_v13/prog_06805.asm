; DESCRIPTION: Draws a green line from (196, 135) to (272, 238).
; PLAN: r0=196(x1), r1=135(y1), r2=272(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 135
LDI r2, 272
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
