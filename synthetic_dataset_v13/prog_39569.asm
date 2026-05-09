; DESCRIPTION: Draws a white line from (286, 24) to (59, 59).
; PLAN: r0=286(x1), r1=24(y1), r2=59(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 24
LDI r2, 59
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
