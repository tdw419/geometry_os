; DESCRIPTION: Draws a green line from (445, 247) to (196, 212).
; PLAN: r0=445(x1), r1=247(y1), r2=196(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 247
LDI r2, 196
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
