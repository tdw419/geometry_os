; DESCRIPTION: Renders a green line between points (213, 149) and (391, 209).
; PLAN: r0=213(x1), r1=149(y1), r2=391(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 149
LDI r2, 391
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
