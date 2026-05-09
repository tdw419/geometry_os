; DESCRIPTION: Renders a cyan line between points (463, 63) and (212, 18).
; PLAN: r0=463(x1), r1=63(y1), r2=212(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 63
LDI r2, 212
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
