; DESCRIPTION: Renders a green line between points (48, 37) and (236, 70).
; PLAN: r0=48(x1), r1=37(y1), r2=236(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 37
LDI r2, 236
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
