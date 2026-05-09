; DESCRIPTION: Composite: Places a black dot at position (394, 81) then Places a black circle of radius 67 at center (351, 168) then Renders a red box of size 103x99 starting at (13, 18).
; PLAN: r0=394(x), r1=81(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=168(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=13(x), r11=18(y), r12=103(width), r13=99(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 81
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 351
LDI r6, 168
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 13
LDI r11, 18
LDI r12, 103
LDI r13, 99
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
