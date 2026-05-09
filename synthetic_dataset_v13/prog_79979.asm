; DESCRIPTION: Renders a green line between points (356, 244) and (281, 219).
; PLAN: r0=356(x1), r1=244(y1), r2=281(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 244
LDI r2, 281
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
