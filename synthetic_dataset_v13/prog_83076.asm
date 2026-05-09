; DESCRIPTION: Renders a magenta line between points (42, 220) and (245, 164).
; PLAN: r0=42(x1), r1=220(y1), r2=245(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 220
LDI r2, 245
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
