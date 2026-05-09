; DESCRIPTION: Renders a cyan line between points (203, 20) and (138, 50).
; PLAN: r0=203(x1), r1=20(y1), r2=138(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 20
LDI r2, 138
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
