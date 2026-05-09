; DESCRIPTION: Renders a cyan line between points (457, 149) and (509, 208).
; PLAN: r0=457(x1), r1=149(y1), r2=509(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 149
LDI r2, 509
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
