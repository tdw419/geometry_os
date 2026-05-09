; DESCRIPTION: Places a blue line segment connecting (380, 28) to (157, 174).
; PLAN: r0=380(x1), r1=28(y1), r2=157(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 28
LDI r2, 157
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
