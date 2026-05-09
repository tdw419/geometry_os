; DESCRIPTION: Renders a cyan line between points (106, 210) and (348, 50).
; PLAN: r0=106(x1), r1=210(y1), r2=348(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 210
LDI r2, 348
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
