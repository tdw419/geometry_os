; DESCRIPTION: Renders a cyan line between points (258, 8) and (216, 248).
; PLAN: r0=258(x1), r1=8(y1), r2=216(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 8
LDI r2, 216
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
