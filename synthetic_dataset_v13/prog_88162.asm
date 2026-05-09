; DESCRIPTION: Composite: Places a red circle of radius 38 at center (205, 90) then Renders a black box of size 18x54 starting at (196, 109).
; PLAN: r0=205(x), r1=90(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x), r6=109(y), r7=18(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 90
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 109
LDI r7, 18
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
