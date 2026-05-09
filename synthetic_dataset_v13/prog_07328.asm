; DESCRIPTION: Draws a red line from (392, 32) to (494, 74).
; PLAN: r0=392(x1), r1=32(y1), r2=494(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 32
LDI r2, 494
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
