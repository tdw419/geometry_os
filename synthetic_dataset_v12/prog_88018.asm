; DESCRIPTION: Renders a cyan line between points (408, 233) and (283, 157).
; PLAN: r0=408(x1), r1=233(y1), r2=283(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 233
LDI r2, 283
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
