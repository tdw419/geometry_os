; DESCRIPTION: Draws a green line from (307, 63) to (237, 47).
; PLAN: r0=307(x1), r1=63(y1), r2=237(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 63
LDI r2, 237
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
