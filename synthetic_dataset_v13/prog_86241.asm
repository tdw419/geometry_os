; DESCRIPTION: Composite: Places a magenta 19x96 rectangle at position (431, 108) then Places a blue line segment connecting (408, 243) to (399, 22).
; PLAN: r0=431(x), r1=108(y), r2=19(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x1), r6=243(y1), r7=399(x2), r8=22(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 108
LDI r2, 19
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 243
LDI r7, 399
LDI r8, 22
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
