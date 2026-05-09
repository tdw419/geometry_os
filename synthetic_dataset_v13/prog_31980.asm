; DESCRIPTION: Draws a white line from (113, 226) to (326, 149).
; PLAN: r0=113(x1), r1=226(y1), r2=326(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 226
LDI r2, 326
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
