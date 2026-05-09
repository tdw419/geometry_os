; DESCRIPTION: Composite: Places a yellow 28x48 rectangle at position (207, 23) then Renders a yellow disk with center (384, 133) and radius 68 then Sets a single purple pixel at (469, 27).
; PLAN: r0=207(x), r1=23(y), r2=28(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=133(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x), r11=27(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 207
LDI r1, 23
LDI r2, 28
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 133
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 27
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
