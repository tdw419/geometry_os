; DESCRIPTION: Draws a blue line from (284, 224) to (187, 141).
; PLAN: r0=284(x1), r1=224(y1), r2=187(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 224
LDI r2, 187
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
