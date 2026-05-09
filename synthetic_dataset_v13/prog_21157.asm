; DESCRIPTION: Composite: Places a magenta dot at position (447, 39) then Places a yellow circle of radius 78 at center (124, 129) then Places a blue 109x64 rectangle at position (252, 66).
; PLAN: r0=447(x), r1=39(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=129(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=252(x), r11=66(y), r12=109(width), r13=64(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 39
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 129
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 252
LDI r11, 66
LDI r12, 109
LDI r13, 64
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
