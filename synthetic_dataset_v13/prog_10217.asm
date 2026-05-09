; DESCRIPTION: Draws a white line from (333, 133) to (418, 113).
; PLAN: r0=333(x1), r1=133(y1), r2=418(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 133
LDI r2, 418
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
