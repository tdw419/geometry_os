; DESCRIPTION: Draws a magenta line from (479, 152) to (162, 20).
; PLAN: r0=479(x1), r1=152(y1), r2=162(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 152
LDI r2, 162
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
