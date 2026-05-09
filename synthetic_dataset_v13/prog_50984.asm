; DESCRIPTION: Draws a cyan line from (371, 100) to (234, 183).
; PLAN: r0=371(x1), r1=100(y1), r2=234(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 100
LDI r2, 234
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
