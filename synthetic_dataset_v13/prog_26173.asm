; DESCRIPTION: Draws a magenta line from (23, 129) to (23, 177).
; PLAN: r0=23(x1), r1=129(y1), r2=23(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 129
LDI r2, 23
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
