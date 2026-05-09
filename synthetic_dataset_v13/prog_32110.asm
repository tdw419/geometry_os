; DESCRIPTION: Renders a black line between points (28, 65) and (187, 134).
; PLAN: r0=28(x1), r1=65(y1), r2=187(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 65
LDI r2, 187
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
