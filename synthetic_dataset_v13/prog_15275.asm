; DESCRIPTION: Composite: Places a black dot at position (73, 157) then Places a magenta circle of radius 54 at center (111, 130) then Places a red 95x21 rectangle at position (413, 168).
; PLAN: r0=73(x), r1=157(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=130(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=413(x), r11=168(y), r12=95(width), r13=21(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 157
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 111
LDI r6, 130
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 413
LDI r11, 168
LDI r12, 95
LDI r13, 21
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
