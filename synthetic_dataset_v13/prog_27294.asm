; DESCRIPTION: Draws a green line from (504, 150) to (338, 94).
; PLAN: r0=504(x1), r1=150(y1), r2=338(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 150
LDI r2, 338
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
