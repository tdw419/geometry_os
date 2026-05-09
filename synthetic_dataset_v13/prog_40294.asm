; DESCRIPTION: Draws a white line from (21, 113) to (309, 103).
; PLAN: r0=21(x1), r1=113(y1), r2=309(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 113
LDI r2, 309
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
