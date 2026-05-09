; DESCRIPTION: Renders a green line between points (127, 189) and (383, 166).
; PLAN: r0=127(x1), r1=189(y1), r2=383(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 189
LDI r2, 383
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
