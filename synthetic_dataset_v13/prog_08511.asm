; DESCRIPTION: Renders a black line between points (440, 149) and (482, 118).
; PLAN: r0=440(x1), r1=149(y1), r2=482(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 149
LDI r2, 482
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
