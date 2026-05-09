; DESCRIPTION: Renders a green line between points (328, 93) and (421, 134).
; PLAN: r0=328(x1), r1=93(y1), r2=421(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 93
LDI r2, 421
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
