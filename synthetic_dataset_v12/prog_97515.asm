; DESCRIPTION: Renders a magenta line between points (208, 178) and (405, 146).
; PLAN: r0=208(x1), r1=178(y1), r2=405(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 178
LDI r2, 405
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
