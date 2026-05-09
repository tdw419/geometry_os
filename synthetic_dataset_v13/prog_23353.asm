; DESCRIPTION: Renders a cyan line between points (511, 132) and (283, 232).
; PLAN: r0=511(x1), r1=132(y1), r2=283(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 132
LDI r2, 283
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
