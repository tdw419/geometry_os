; DESCRIPTION: Renders a green line between points (160, 226) and (236, 132).
; PLAN: r0=160(x1), r1=226(y1), r2=236(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 226
LDI r2, 236
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
