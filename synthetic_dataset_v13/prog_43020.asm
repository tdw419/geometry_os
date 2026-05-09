; DESCRIPTION: Draws a magenta line from (161, 127) to (178, 192).
; PLAN: r0=161(x1), r1=127(y1), r2=178(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 127
LDI r2, 178
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
