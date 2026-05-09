; DESCRIPTION: Renders a cyan line between points (326, 216) and (269, 138).
; PLAN: r0=326(x1), r1=216(y1), r2=269(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 216
LDI r2, 269
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
