; DESCRIPTION: Places a magenta line segment connecting (195, 215) to (410, 39).
; PLAN: r0=195(x1), r1=215(y1), r2=410(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 215
LDI r2, 410
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
