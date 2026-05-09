; DESCRIPTION: Composite: Places a cyan dot at position (224, 102) then Places a magenta circle of radius 25 at center (63, 61) then Places a yellow 104x41 rectangle at position (62, 20).
; PLAN: r0=224(x), r1=102(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=61(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=62(x), r11=20(y), r12=104(width), r13=41(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 224
LDI r1, 102
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 61
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 62
LDI r11, 20
LDI r12, 104
LDI r13, 41
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
