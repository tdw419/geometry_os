; DESCRIPTION: Draws a magenta line from (386, 103) to (144, 168).
; PLAN: r0=386(x1), r1=103(y1), r2=144(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 103
LDI r2, 144
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
