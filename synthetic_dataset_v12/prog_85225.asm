; DESCRIPTION: Renders a cyan line between points (234, 168) and (505, 199).
; PLAN: r0=234(x1), r1=168(y1), r2=505(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 168
LDI r2, 505
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
