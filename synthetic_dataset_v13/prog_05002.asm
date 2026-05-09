; DESCRIPTION: Renders a cyan line between points (88, 149) and (225, 208).
; PLAN: r0=88(x1), r1=149(y1), r2=225(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 149
LDI r2, 225
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
