; DESCRIPTION: Renders a cyan line between points (461, 102) and (485, 121).
; PLAN: r0=461(x1), r1=102(y1), r2=485(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 102
LDI r2, 485
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
