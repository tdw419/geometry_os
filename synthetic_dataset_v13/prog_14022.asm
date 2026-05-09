; DESCRIPTION: Places a magenta line segment connecting (420, 90) to (243, 236).
; PLAN: r0=420(x1), r1=90(y1), r2=243(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 90
LDI r2, 243
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
