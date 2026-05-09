; DESCRIPTION: Draws a cyan line from (33, 137) to (396, 182).
; PLAN: r0=33(x1), r1=137(y1), r2=396(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 137
LDI r2, 396
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
