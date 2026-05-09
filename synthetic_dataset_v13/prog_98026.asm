; DESCRIPTION: Draws a magenta line from (305, 2) to (346, 81).
; PLAN: r0=305(x1), r1=2(y1), r2=346(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 2
LDI r2, 346
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
