; DESCRIPTION: Renders a magenta line between points (268, 171) and (271, 86).
; PLAN: r0=268(x1), r1=171(y1), r2=271(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 171
LDI r2, 271
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
