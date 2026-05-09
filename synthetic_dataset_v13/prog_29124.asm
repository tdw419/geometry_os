; DESCRIPTION: Composite: Sets a single purple pixel at (72, 99) then Places a red circle of radius 43 at center (367, 111) then Places a white 22x78 rectangle at position (262, 54).
; PLAN: r0=72(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=111(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=262(x), r11=54(y), r12=22(width), r13=78(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 111
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 262
LDI r11, 54
LDI r12, 22
LDI r13, 78
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
