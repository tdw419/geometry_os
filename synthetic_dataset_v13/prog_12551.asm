; DESCRIPTION: Renders a magenta line between points (87, 239) and (63, 223).
; PLAN: r0=87(x1), r1=239(y1), r2=63(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 239
LDI r2, 63
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
