; DESCRIPTION: Draws a cyan line from (83, 153) to (332, 87).
; PLAN: r0=83(x1), r1=153(y1), r2=332(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 153
LDI r2, 332
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
