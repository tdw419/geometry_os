; DESCRIPTION: Renders a red line between points (254, 13) and (82, 27).
; PLAN: r0=254(x1), r1=13(y1), r2=82(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 13
LDI r2, 82
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
