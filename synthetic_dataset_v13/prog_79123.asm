; DESCRIPTION: Places a white line segment connecting (184, 27) to (340, 94).
; PLAN: r0=184(x1), r1=27(y1), r2=340(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 27
LDI r2, 340
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
