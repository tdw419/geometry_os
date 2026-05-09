; DESCRIPTION: Renders a green line between points (247, 166) and (171, 241).
; PLAN: r0=247(x1), r1=166(y1), r2=171(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 166
LDI r2, 171
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
