; DESCRIPTION: Draws a white line from (429, 28) to (342, 113).
; PLAN: r0=429(x1), r1=28(y1), r2=342(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 28
LDI r2, 342
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
