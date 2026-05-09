; DESCRIPTION: Renders a green line between points (440, 8) and (2, 27).
; PLAN: r0=440(x1), r1=8(y1), r2=2(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 8
LDI r2, 2
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
