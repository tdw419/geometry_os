; DESCRIPTION: Places a magenta line segment connecting (343, 242) to (262, 154).
; PLAN: r0=343(x1), r1=242(y1), r2=262(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 242
LDI r2, 262
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
