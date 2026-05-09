; DESCRIPTION: Renders a black line between points (440, 50) and (29, 210).
; PLAN: r0=440(x1), r1=50(y1), r2=29(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 50
LDI r2, 29
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
