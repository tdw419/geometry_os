; DESCRIPTION: Draws a red line from (256, 76) to (502, 175).
; PLAN: r0=256(x1), r1=76(y1), r2=502(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 76
LDI r2, 502
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
