; DESCRIPTION: Composite: Draws a magenta line from (510, 53) to (243, 69) then Sets a single yellow pixel at (64, 172).
; PLAN: r0=510(x1), r1=53(y1), r2=243(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=172(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 510
LDI r1, 53
LDI r2, 243
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 172
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
