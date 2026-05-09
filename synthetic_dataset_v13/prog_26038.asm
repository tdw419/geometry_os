; DESCRIPTION: Renders a black line between points (215, 214) and (175, 134).
; PLAN: r0=215(x1), r1=214(y1), r2=175(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 214
LDI r2, 175
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
