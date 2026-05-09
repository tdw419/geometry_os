; DESCRIPTION: Renders a cyan line between points (215, 101) and (339, 53).
; PLAN: r0=215(x1), r1=101(y1), r2=339(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 101
LDI r2, 339
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
