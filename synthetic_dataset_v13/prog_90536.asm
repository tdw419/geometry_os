; DESCRIPTION: Composite: Renders a orange box of size 22x21 starting at (94, 160) then Places a green circle of radius 31 at center (310, 124).
; PLAN: r0=94(x), r1=160(y), r2=22(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=124(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 160
LDI r2, 22
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 124
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
