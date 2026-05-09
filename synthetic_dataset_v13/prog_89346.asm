; DESCRIPTION: Draws a magenta line from (470, 214) to (9, 210).
; PLAN: r0=470(x1), r1=214(y1), r2=9(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 214
LDI r2, 9
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
