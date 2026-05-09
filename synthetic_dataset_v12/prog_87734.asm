; DESCRIPTION: Renders a magenta line between points (33, 42) and (40, 16).
; PLAN: r0=33(x1), r1=42(y1), r2=40(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 42
LDI r2, 40
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
