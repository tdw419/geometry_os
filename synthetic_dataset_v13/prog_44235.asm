; DESCRIPTION: Composite: Renders a yellow box of size 21x61 starting at (198, 58) then Places a magenta circle of radius 28 at center (48, 112) then Places a magenta dot at position (245, 108).
; PLAN: r0=198(x), r1=58(y), r2=21(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=112(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x), r11=108(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 58
LDI r2, 21
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 112
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 108
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
