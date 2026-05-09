; DESCRIPTION: Renders a green line between points (329, 146) and (106, 150).
; PLAN: r0=329(x1), r1=146(y1), r2=106(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 146
LDI r2, 106
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
