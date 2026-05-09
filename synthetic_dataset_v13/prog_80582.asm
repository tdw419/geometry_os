; DESCRIPTION: Renders a magenta line between points (50, 7) and (381, 242).
; PLAN: r0=50(x1), r1=7(y1), r2=381(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 7
LDI r2, 381
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
