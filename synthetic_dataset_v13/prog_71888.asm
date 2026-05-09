; DESCRIPTION: Composite: Creates a magenta circular shape at (380, 172) with radius 49 then Places a cyan line segment connecting (13, 132) to (61, 7).
; PLAN: r0=380(x), r1=172(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x1), r6=132(y1), r7=61(x2), r8=7(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 172
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 132
LDI r7, 61
LDI r8, 7
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
