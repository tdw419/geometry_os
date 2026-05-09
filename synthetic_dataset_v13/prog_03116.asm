; DESCRIPTION: Draws a cyan line from (1, 153) to (114, 44).
; PLAN: r0=1(x1), r1=153(y1), r2=114(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 153
LDI r2, 114
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
