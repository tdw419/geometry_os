; DESCRIPTION: Renders a green line between points (120, 99) and (391, 113).
; PLAN: r0=120(x1), r1=99(y1), r2=391(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 99
LDI r2, 391
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
