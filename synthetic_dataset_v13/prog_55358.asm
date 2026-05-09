; DESCRIPTION: Draws a magenta line from (261, 228) to (16, 73).
; PLAN: r0=261(x1), r1=228(y1), r2=16(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 228
LDI r2, 16
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
