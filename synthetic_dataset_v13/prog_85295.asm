; DESCRIPTION: Renders a cyan line between points (356, 62) and (213, 216).
; PLAN: r0=356(x1), r1=62(y1), r2=213(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 62
LDI r2, 213
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
