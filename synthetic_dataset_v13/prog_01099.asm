; DESCRIPTION: Composite: Draws a yellow rectangle at (447, 16) with width 58 and height 42 then Sets a single magenta pixel at (280, 5).
; PLAN: r0=447(x), r1=16(y), r2=58(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=5(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 16
LDI r2, 58
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 5
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
