; DESCRIPTION: Renders a cyan line between points (205, 161) and (267, 56).
; PLAN: r0=205(x1), r1=161(y1), r2=267(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 161
LDI r2, 267
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
