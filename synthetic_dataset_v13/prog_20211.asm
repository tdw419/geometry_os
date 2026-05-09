; DESCRIPTION: Draws a black line from (447, 229) to (146, 127).
; PLAN: r0=447(x1), r1=229(y1), r2=146(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 229
LDI r2, 146
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
