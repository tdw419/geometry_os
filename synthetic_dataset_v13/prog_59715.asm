; DESCRIPTION: Renders a cyan line between points (291, 223) and (99, 140).
; PLAN: r0=291(x1), r1=223(y1), r2=99(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 223
LDI r2, 99
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
