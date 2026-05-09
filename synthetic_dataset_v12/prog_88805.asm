; DESCRIPTION: Draws a magenta line from (352, 135) to (304, 210).
; PLAN: r0=352(x1), r1=135(y1), r2=304(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 135
LDI r2, 304
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
