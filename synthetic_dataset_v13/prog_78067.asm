; DESCRIPTION: Renders a magenta line between points (290, 146) and (450, 28).
; PLAN: r0=290(x1), r1=146(y1), r2=450(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 146
LDI r2, 450
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
