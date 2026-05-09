; DESCRIPTION: Draws a magenta line from (40, 242) to (123, 202).
; PLAN: r0=40(x1), r1=242(y1), r2=123(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 242
LDI r2, 123
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
