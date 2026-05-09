; DESCRIPTION: Draws a magenta line from (482, 228) to (13, 45).
; PLAN: r0=482(x1), r1=228(y1), r2=13(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 228
LDI r2, 13
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
