; DESCRIPTION: Renders a cyan line between points (45, 137) and (461, 132).
; PLAN: r0=45(x1), r1=137(y1), r2=461(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 137
LDI r2, 461
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
