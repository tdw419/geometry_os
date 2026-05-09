; DESCRIPTION: Composite: Places a purple dot at position (297, 102) then Renders a cyan disk with center (128, 88) and radius 75 then Renders a orange box of size 82x58 starting at (424, 152).
; PLAN: r0=297(x), r1=102(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=128(x), r6=88(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=424(x), r11=152(y), r12=82(width), r13=58(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 102
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 128
LDI r6, 88
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 424
LDI r11, 152
LDI r12, 82
LDI r13, 58
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
