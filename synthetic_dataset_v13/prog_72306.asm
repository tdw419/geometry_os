; DESCRIPTION: Composite: Places a black dot at position (340, 206) then Renders a yellow box of size 81x29 starting at (375, 169).
; PLAN: r0=340(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=169(y), r7=81(width), r8=29(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 206
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 375
LDI r6, 169
LDI r7, 81
LDI r8, 29
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
