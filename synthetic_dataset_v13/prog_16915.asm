; DESCRIPTION: Renders a cyan line between points (220, 119) and (474, 132).
; PLAN: r0=220(x1), r1=119(y1), r2=474(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 119
LDI r2, 474
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
