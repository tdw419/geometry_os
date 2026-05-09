; DESCRIPTION: Places a white line segment connecting (324, 18) to (197, 113).
; PLAN: r0=324(x1), r1=18(y1), r2=197(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 18
LDI r2, 197
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
