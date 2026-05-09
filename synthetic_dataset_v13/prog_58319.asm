; DESCRIPTION: Renders a cyan line between points (89, 168) and (69, 10).
; PLAN: r0=89(x1), r1=168(y1), r2=69(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 168
LDI r2, 69
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
