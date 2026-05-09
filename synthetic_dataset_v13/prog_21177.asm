; DESCRIPTION: Composite: Creates a black circular shape at (330, 104) with radius 41 then Places a cyan line segment connecting (460, 150) to (384, 33).
; PLAN: r0=330(x), r1=104(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x1), r6=150(y1), r7=384(x2), r8=33(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 104
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 150
LDI r7, 384
LDI r8, 33
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
