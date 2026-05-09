; DESCRIPTION: Draws a white line from (58, 32) to (174, 175).
; PLAN: r0=58(x1), r1=32(y1), r2=174(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 32
LDI r2, 174
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
