; DESCRIPTION: Draws a magenta line from (333, 159) to (168, 44).
; PLAN: r0=333(x1), r1=159(y1), r2=168(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 159
LDI r2, 168
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
