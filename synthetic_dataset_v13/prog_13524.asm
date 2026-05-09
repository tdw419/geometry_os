; DESCRIPTION: Renders a green line between points (505, 48) and (175, 146).
; PLAN: r0=505(x1), r1=48(y1), r2=175(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 48
LDI r2, 175
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
