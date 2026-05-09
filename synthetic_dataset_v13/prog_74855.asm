; DESCRIPTION: Composite: Places a green dot at position (23, 109) then Renders a yellow box of size 104x78 starting at (310, 108).
; PLAN: r0=23(x), r1=109(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=108(y), r7=104(width), r8=78(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 109
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 310
LDI r6, 108
LDI r7, 104
LDI r8, 78
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
