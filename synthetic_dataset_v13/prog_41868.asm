; DESCRIPTION: Renders a green line between points (470, 160) and (146, 250).
; PLAN: r0=470(x1), r1=160(y1), r2=146(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 160
LDI r2, 146
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
