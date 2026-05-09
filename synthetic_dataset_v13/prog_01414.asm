; DESCRIPTION: Renders a magenta line between points (122, 223) and (386, 171).
; PLAN: r0=122(x1), r1=223(y1), r2=386(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 223
LDI r2, 386
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
