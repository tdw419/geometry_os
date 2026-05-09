; DESCRIPTION: Draws a magenta line from (23, 170) to (479, 103).
; PLAN: r0=23(x1), r1=170(y1), r2=479(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 170
LDI r2, 479
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
