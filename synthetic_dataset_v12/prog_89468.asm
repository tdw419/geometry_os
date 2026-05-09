; DESCRIPTION: Renders a cyan line between points (172, 8) and (356, 76).
; PLAN: r0=172(x1), r1=8(y1), r2=356(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 8
LDI r2, 356
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
