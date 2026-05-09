; DESCRIPTION: Renders a cyan line between points (499, 75) and (10, 62).
; PLAN: r0=499(x1), r1=75(y1), r2=10(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 75
LDI r2, 10
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
