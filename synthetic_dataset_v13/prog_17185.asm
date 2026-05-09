; DESCRIPTION: Draws a white line from (295, 133) to (53, 39).
; PLAN: r0=295(x1), r1=133(y1), r2=53(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 133
LDI r2, 53
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
