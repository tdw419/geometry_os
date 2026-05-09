; DESCRIPTION: Draws a magenta line from (401, 237) to (346, 135).
; PLAN: r0=401(x1), r1=237(y1), r2=346(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 237
LDI r2, 346
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
