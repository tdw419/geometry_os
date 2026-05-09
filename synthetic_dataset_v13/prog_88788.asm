; DESCRIPTION: Draws a magenta line from (494, 60) to (410, 35).
; PLAN: r0=494(x1), r1=60(y1), r2=410(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 60
LDI r2, 410
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
