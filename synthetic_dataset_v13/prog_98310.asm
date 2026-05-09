; DESCRIPTION: Renders a cyan line between points (234, 124) and (63, 254).
; PLAN: r0=234(x1), r1=124(y1), r2=63(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 124
LDI r2, 63
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
