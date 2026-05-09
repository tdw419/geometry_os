; DESCRIPTION: Renders a magenta line between points (303, 197) and (152, 250).
; PLAN: r0=303(x1), r1=197(y1), r2=152(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 197
LDI r2, 152
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
