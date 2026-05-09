; DESCRIPTION: Renders a red line between points (149, 194) and (386, 42).
; PLAN: r0=149(x1), r1=194(y1), r2=386(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 194
LDI r2, 386
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
