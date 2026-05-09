; DESCRIPTION: Draws a green line from (505, 103) to (19, 113).
; PLAN: r0=505(x1), r1=103(y1), r2=19(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 103
LDI r2, 19
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
