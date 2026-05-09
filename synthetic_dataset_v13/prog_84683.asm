; DESCRIPTION: Draws a magenta line from (185, 86) to (398, 164).
; PLAN: r0=185(x1), r1=86(y1), r2=398(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 86
LDI r2, 398
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
