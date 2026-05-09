; DESCRIPTION: Composite: Draws a magenta line from (10, 205) to (301, 28) then Sets a single orange pixel at (244, 242).
; PLAN: r0=10(x1), r1=205(y1), r2=301(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 10
LDI r1, 205
LDI r2, 301
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
