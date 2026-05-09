; DESCRIPTION: Draws a white line from (82, 218) to (387, 112).
; PLAN: r0=82(x1), r1=218(y1), r2=387(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 218
LDI r2, 387
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
