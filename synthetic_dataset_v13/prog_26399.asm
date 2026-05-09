; DESCRIPTION: Composite: Places a black dot at position (57, 89) then Renders a yellow disk with center (335, 139) and radius 31 then Renders a orange box of size 98x59 starting at (354, 179).
; PLAN: r0=57(x), r1=89(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=139(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x), r11=179(y), r12=98(width), r13=59(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 89
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 335
LDI r6, 139
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 179
LDI r12, 98
LDI r13, 59
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
