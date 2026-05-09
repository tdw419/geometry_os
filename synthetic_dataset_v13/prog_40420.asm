; DESCRIPTION: Renders a green line between points (263, 97) and (72, 49).
; PLAN: r0=263(x1), r1=97(y1), r2=72(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 97
LDI r2, 72
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
