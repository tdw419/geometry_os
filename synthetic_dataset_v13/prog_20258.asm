; DESCRIPTION: Renders a green line between points (445, 111) and (181, 191).
; PLAN: r0=445(x1), r1=111(y1), r2=181(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 111
LDI r2, 181
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
