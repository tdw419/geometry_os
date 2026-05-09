; DESCRIPTION: Renders a magenta line between points (98, 228) and (229, 239).
; PLAN: r0=98(x1), r1=228(y1), r2=229(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 228
LDI r2, 229
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
