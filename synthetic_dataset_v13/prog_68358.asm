; DESCRIPTION: Renders a magenta line between points (49, 173) and (98, 146).
; PLAN: r0=49(x1), r1=173(y1), r2=98(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 173
LDI r2, 98
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
