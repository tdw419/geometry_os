; DESCRIPTION: Renders a magenta line between points (27, 161) and (83, 210).
; PLAN: r0=27(x1), r1=161(y1), r2=83(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 161
LDI r2, 83
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
