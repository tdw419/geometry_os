; DESCRIPTION: Renders a cyan line between points (138, 191) and (371, 138).
; PLAN: r0=138(x1), r1=191(y1), r2=371(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 191
LDI r2, 371
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
