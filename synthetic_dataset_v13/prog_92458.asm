; DESCRIPTION: Draws a magenta line from (255, 210) to (37, 16).
; PLAN: r0=255(x1), r1=210(y1), r2=37(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 210
LDI r2, 37
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
