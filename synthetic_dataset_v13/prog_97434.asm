; DESCRIPTION: Composite: Creates a black circular shape at (233, 128) with radius 67 then Draws a cyan line from (483, 154) to (271, 72).
; PLAN: r0=233(x), r1=128(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x1), r6=154(y1), r7=271(x2), r8=72(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 128
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 154
LDI r7, 271
LDI r8, 72
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
