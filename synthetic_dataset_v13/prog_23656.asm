; DESCRIPTION: Draws a purple line from (387, 61) to (270, 228).
; PLAN: r0=387(x1), r1=61(y1), r2=270(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 61
LDI r2, 270
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
