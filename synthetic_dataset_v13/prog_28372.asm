; DESCRIPTION: Draws a green line from (447, 121) to (480, 71).
; PLAN: r0=447(x1), r1=121(y1), r2=480(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 121
LDI r2, 480
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
