; DESCRIPTION: Renders a magenta line between points (370, 29) and (470, 146).
; PLAN: r0=370(x1), r1=29(y1), r2=470(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 29
LDI r2, 470
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
