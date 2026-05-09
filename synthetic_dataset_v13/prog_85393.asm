; DESCRIPTION: Renders a cyan line between points (343, 69) and (114, 56).
; PLAN: r0=343(x1), r1=69(y1), r2=114(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 69
LDI r2, 114
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
