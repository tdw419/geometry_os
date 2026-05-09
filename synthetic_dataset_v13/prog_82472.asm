; DESCRIPTION: Renders a cyan line between points (119, 234) and (220, 67).
; PLAN: r0=119(x1), r1=234(y1), r2=220(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 234
LDI r2, 220
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
