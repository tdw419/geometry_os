; DESCRIPTION: Renders a white line between points (254, 30) and (252, 215).
; PLAN: r0=254(x1), r1=30(y1), r2=252(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 30
LDI r2, 252
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
