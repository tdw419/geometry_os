; DESCRIPTION: Renders a cyan line between points (262, 5) and (203, 254).
; PLAN: r0=262(x1), r1=5(y1), r2=203(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 5
LDI r2, 203
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
