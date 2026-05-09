; DESCRIPTION: Draws a cyan line from (170, 138) to (234, 179).
; PLAN: r0=170(x1), r1=138(y1), r2=234(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 138
LDI r2, 234
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
