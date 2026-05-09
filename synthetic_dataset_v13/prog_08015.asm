; DESCRIPTION: Renders a magenta line between points (187, 112) and (154, 128).
; PLAN: r0=187(x1), r1=112(y1), r2=154(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 112
LDI r2, 154
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
