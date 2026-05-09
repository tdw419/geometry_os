; DESCRIPTION: Draws a white line from (387, 80) to (20, 48).
; PLAN: r0=387(x1), r1=80(y1), r2=20(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 80
LDI r2, 20
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
