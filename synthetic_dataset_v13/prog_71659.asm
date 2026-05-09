; DESCRIPTION: Draws a cyan line from (396, 160) to (356, 153).
; PLAN: r0=396(x1), r1=160(y1), r2=356(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 160
LDI r2, 356
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
