; DESCRIPTION: Draws a cyan line from (61, 114) to (24, 140).
; PLAN: r0=61(x1), r1=114(y1), r2=24(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 114
LDI r2, 24
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
