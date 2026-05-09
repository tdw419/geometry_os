; DESCRIPTION: Draws a cyan line from (289, 171) to (162, 2).
; PLAN: r0=289(x1), r1=171(y1), r2=162(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 171
LDI r2, 162
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
