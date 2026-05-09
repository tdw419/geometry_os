; DESCRIPTION: Draws a magenta line from (135, 72) to (242, 112).
; PLAN: r0=135(x1), r1=72(y1), r2=242(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 72
LDI r2, 242
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
