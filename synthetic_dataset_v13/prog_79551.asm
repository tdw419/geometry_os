; DESCRIPTION: Places a magenta line segment connecting (294, 157) to (482, 182).
; PLAN: r0=294(x1), r1=157(y1), r2=482(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 157
LDI r2, 482
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
