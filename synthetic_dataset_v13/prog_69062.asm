; DESCRIPTION: Draws a magenta line from (242, 98) to (355, 157).
; PLAN: r0=242(x1), r1=98(y1), r2=355(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 98
LDI r2, 355
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
