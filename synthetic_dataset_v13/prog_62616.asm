; DESCRIPTION: Composite: Places a red dot at position (402, 19) then Renders a black box of size 99x44 starting at (264, 69).
; PLAN: r0=402(x), r1=19(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=69(y), r7=99(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 19
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 264
LDI r6, 69
LDI r7, 99
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
