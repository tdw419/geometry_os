; DESCRIPTION: Draws a green line from (21, 67) to (394, 144).
; PLAN: r0=21(x1), r1=67(y1), r2=394(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 67
LDI r2, 394
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
