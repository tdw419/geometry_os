; DESCRIPTION: Renders a magenta line between points (303, 245) and (197, 46).
; PLAN: r0=303(x1), r1=245(y1), r2=197(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 245
LDI r2, 197
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
