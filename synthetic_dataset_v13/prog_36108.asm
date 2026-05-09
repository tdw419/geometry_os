; DESCRIPTION: Draws a magenta line from (183, 253) to (503, 63).
; PLAN: r0=183(x1), r1=253(y1), r2=503(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 253
LDI r2, 503
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
