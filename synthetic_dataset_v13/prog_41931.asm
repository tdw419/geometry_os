; DESCRIPTION: Composite: Renders a cyan box of size 27x18 starting at (1, 207) then Draws a green circle centered at (298, 207) with radius 41.
; PLAN: r0=1(x), r1=207(y), r2=27(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=207(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 207
LDI r2, 27
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 207
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
