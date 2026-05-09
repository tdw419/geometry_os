; DESCRIPTION: Draws a magenta line from (405, 40) to (307, 255).
; PLAN: r0=405(x1), r1=40(y1), r2=307(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 40
LDI r2, 307
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
