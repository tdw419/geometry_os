; DESCRIPTION: Draws a cyan line from (313, 114) to (454, 165).
; PLAN: r0=313(x1), r1=114(y1), r2=454(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 114
LDI r2, 454
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
