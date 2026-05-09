; DESCRIPTION: Draws a white line from (337, 31) to (502, 135).
; PLAN: r0=337(x1), r1=31(y1), r2=502(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 31
LDI r2, 502
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
