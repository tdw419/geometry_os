; DESCRIPTION: Renders a white line between points (304, 236) and (387, 33).
; PLAN: r0=304(x1), r1=236(y1), r2=387(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 236
LDI r2, 387
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
