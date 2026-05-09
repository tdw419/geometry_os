; DESCRIPTION: Draws a magenta line from (327, 202) to (167, 239).
; PLAN: r0=327(x1), r1=202(y1), r2=167(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 202
LDI r2, 167
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
