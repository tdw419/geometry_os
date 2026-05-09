; DESCRIPTION: Renders a cyan line between points (210, 241) and (58, 188).
; PLAN: r0=210(x1), r1=241(y1), r2=58(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 241
LDI r2, 58
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
