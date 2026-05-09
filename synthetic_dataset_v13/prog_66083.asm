; DESCRIPTION: Draws a white line from (392, 117) to (494, 122).
; PLAN: r0=392(x1), r1=117(y1), r2=494(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 117
LDI r2, 494
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
