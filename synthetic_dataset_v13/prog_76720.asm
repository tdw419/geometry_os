; DESCRIPTION: Renders a cyan line between points (300, 140) and (5, 134).
; PLAN: r0=300(x1), r1=140(y1), r2=5(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 140
LDI r2, 5
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
