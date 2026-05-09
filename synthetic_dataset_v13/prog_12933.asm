; DESCRIPTION: Renders a green line between points (193, 168) and (98, 127).
; PLAN: r0=193(x1), r1=168(y1), r2=98(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 168
LDI r2, 98
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
