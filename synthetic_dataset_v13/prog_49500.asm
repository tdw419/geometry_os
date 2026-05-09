; DESCRIPTION: Draws a cyan line from (312, 128) to (119, 234).
; PLAN: r0=312(x1), r1=128(y1), r2=119(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 128
LDI r2, 119
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
