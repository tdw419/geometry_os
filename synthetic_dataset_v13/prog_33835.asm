; DESCRIPTION: Renders a red line between points (440, 237) and (333, 226).
; PLAN: r0=440(x1), r1=237(y1), r2=333(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 237
LDI r2, 333
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
