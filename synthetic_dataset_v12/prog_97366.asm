; DESCRIPTION: Draws a red line from (384, 155) to (392, 20).
; PLAN: r0=384(x1), r1=155(y1), r2=392(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 155
LDI r2, 392
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
