; DESCRIPTION: Renders a cyan line between points (10, 250) and (499, 74).
; PLAN: r0=10(x1), r1=250(y1), r2=499(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 250
LDI r2, 499
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
