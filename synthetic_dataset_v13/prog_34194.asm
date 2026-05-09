; DESCRIPTION: Draws a magenta line from (102, 202) to (368, 174).
; PLAN: r0=102(x1), r1=202(y1), r2=368(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 202
LDI r2, 368
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
