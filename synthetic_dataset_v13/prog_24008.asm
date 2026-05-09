; DESCRIPTION: Draws a blue line from (220, 31) to (315, 228).
; PLAN: r0=220(x1), r1=31(y1), r2=315(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 31
LDI r2, 315
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
