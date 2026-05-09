; DESCRIPTION: Renders a magenta line between points (17, 202) and (361, 228).
; PLAN: r0=17(x1), r1=202(y1), r2=361(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 202
LDI r2, 361
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
