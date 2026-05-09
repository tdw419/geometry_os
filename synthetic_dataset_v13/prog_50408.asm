; DESCRIPTION: Renders a cyan line between points (140, 122) and (183, 182).
; PLAN: r0=140(x1), r1=122(y1), r2=183(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 122
LDI r2, 183
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
