; DESCRIPTION: Draws a magenta line from (486, 48) to (393, 27).
; PLAN: r0=486(x1), r1=48(y1), r2=393(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 48
LDI r2, 393
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
