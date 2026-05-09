; DESCRIPTION: Draws a green line from (387, 202) to (262, 47).
; PLAN: r0=387(x1), r1=202(y1), r2=262(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 202
LDI r2, 262
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
