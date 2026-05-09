; DESCRIPTION: Draws a green line from (217, 113) to (480, 123).
; PLAN: r0=217(x1), r1=113(y1), r2=480(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 113
LDI r2, 480
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
