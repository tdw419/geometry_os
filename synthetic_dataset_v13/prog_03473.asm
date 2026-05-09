; DESCRIPTION: Draws a cyan line from (81, 194) to (208, 129).
; PLAN: r0=81(x1), r1=194(y1), r2=208(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 194
LDI r2, 208
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
