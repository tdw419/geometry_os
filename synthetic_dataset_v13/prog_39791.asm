; DESCRIPTION: Draws a cyan line from (72, 149) to (452, 116).
; PLAN: r0=72(x1), r1=149(y1), r2=452(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 149
LDI r2, 452
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
