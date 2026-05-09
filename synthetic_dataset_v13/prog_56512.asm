; DESCRIPTION: Draws a magenta line from (410, 97) to (23, 49).
; PLAN: r0=410(x1), r1=97(y1), r2=23(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 97
LDI r2, 23
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
