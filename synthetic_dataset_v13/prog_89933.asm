; DESCRIPTION: Draws a magenta line from (239, 166) to (327, 161).
; PLAN: r0=239(x1), r1=166(y1), r2=327(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 166
LDI r2, 327
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
