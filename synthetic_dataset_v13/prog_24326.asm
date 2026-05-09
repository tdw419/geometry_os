; DESCRIPTION: Draws a white line from (82, 32) to (244, 77).
; PLAN: r0=82(x1), r1=32(y1), r2=244(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 32
LDI r2, 244
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
