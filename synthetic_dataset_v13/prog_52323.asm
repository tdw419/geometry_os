; DESCRIPTION: Draws a magenta line from (327, 20) to (284, 57).
; PLAN: r0=327(x1), r1=20(y1), r2=284(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 20
LDI r2, 284
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
