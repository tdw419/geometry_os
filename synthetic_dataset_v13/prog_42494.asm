; DESCRIPTION: Draws a magenta line from (230, 152) to (352, 43).
; PLAN: r0=230(x1), r1=152(y1), r2=352(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 152
LDI r2, 352
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
