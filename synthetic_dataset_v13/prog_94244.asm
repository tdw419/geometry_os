; DESCRIPTION: Draws a white line from (164, 207) to (23, 113).
; PLAN: r0=164(x1), r1=207(y1), r2=23(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 207
LDI r2, 23
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
