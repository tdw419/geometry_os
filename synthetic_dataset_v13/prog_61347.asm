; DESCRIPTION: Renders a yellow line between points (164, 149) and (228, 248).
; PLAN: r0=164(x1), r1=149(y1), r2=228(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 149
LDI r2, 228
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
