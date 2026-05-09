; DESCRIPTION: Renders a cyan line between points (490, 231) and (145, 48).
; PLAN: r0=490(x1), r1=231(y1), r2=145(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 231
LDI r2, 145
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
