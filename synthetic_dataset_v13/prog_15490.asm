; DESCRIPTION: Renders a cyan line between points (60, 155) and (392, 114).
; PLAN: r0=60(x1), r1=155(y1), r2=392(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 155
LDI r2, 392
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
