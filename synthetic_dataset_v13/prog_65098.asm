; DESCRIPTION: Renders a white line between points (473, 195) and (319, 214).
; PLAN: r0=473(x1), r1=195(y1), r2=319(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 195
LDI r2, 319
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
