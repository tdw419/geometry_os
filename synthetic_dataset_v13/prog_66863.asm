; DESCRIPTION: Composite: Creates a white circular shape at (111, 124) with radius 67 then Draws a black line from (1, 18) to (320, 151).
; PLAN: r0=111(x), r1=124(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x1), r6=18(y1), r7=320(x2), r8=151(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 124
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 18
LDI r7, 320
LDI r8, 151
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
