; DESCRIPTION: Draws a green line from (151, 121) to (48, 214).
; PLAN: r0=151(x1), r1=121(y1), r2=48(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 121
LDI r2, 48
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
