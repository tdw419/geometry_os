; DESCRIPTION: Renders a cyan line between points (343, 12) and (511, 246).
; PLAN: r0=343(x1), r1=12(y1), r2=511(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 12
LDI r2, 511
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
