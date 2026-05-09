; DESCRIPTION: Draws a white line from (371, 146) to (368, 165).
; PLAN: r0=371(x1), r1=146(y1), r2=368(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 146
LDI r2, 368
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
