; DESCRIPTION: Composite: Places a yellow line segment connecting (310, 45) to (249, 0) then Places a white 35x49 rectangle at position (256, 15).
; PLAN: r0=310(x1), r1=45(y1), r2=249(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=15(y), r7=35(width), r8=49(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 45
LDI r2, 249
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 15
LDI r7, 35
LDI r8, 49
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
