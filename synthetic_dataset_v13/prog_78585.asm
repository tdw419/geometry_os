; DESCRIPTION: Renders a cyan line between points (457, 122) and (214, 246).
; PLAN: r0=457(x1), r1=122(y1), r2=214(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 122
LDI r2, 214
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
