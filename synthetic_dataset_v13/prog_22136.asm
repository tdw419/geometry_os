; DESCRIPTION: Places a white line segment connecting (68, 220) to (126, 249).
; PLAN: r0=68(x1), r1=220(y1), r2=126(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 220
LDI r2, 126
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
