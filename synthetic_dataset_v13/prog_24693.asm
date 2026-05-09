; DESCRIPTION: Composite: Draws a magenta line from (397, 1) to (32, 114) then Creates a orange rectangular region at (361, 106) spanning 56 by 74 pixels.
; PLAN: r0=397(x1), r1=1(y1), r2=32(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=106(y), r7=56(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 1
LDI r2, 32
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 106
LDI r7, 56
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
