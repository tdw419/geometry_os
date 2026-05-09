; DESCRIPTION: Composite: Draws a magenta line from (38, 63) to (113, 118) then Renders a magenta disk with center (265, 82) and radius 27.
; PLAN: r0=38(x1), r1=63(y1), r2=113(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=82(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 63
LDI r2, 113
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 82
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
