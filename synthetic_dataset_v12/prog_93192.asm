; DESCRIPTION: Places a magenta line segment connecting (271, 248) to (443, 164).
; PLAN: r0=271(x1), r1=248(y1), r2=443(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 248
LDI r2, 443
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
