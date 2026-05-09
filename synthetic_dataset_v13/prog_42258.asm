; DESCRIPTION: Renders a magenta line between points (68, 56) and (171, 146).
; PLAN: r0=68(x1), r1=56(y1), r2=171(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 56
LDI r2, 171
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
