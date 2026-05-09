; DESCRIPTION: Draws a purple line from (455, 82) to (464, 174).
; PLAN: r0=455(x1), r1=82(y1), r2=464(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 82
LDI r2, 464
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
