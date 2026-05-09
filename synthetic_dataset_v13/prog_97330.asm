; DESCRIPTION: Draws a cyan line from (194, 99) to (234, 100).
; PLAN: r0=194(x1), r1=99(y1), r2=234(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 99
LDI r2, 234
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
