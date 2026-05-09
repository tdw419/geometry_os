; DESCRIPTION: Draws a magenta line from (381, 12) to (284, 33).
; PLAN: r0=381(x1), r1=12(y1), r2=284(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 12
LDI r2, 284
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
