; DESCRIPTION: Renders a cyan line between points (107, 184) and (152, 232).
; PLAN: r0=107(x1), r1=184(y1), r2=152(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 184
LDI r2, 152
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
