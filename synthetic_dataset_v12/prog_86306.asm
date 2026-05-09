; DESCRIPTION: Composite: Draws a cyan rectangle at (403, 42) with width 103 and height 113 then Creates a orange circular shape at (349, 168) with radius 19 then Sets a single magenta pixel at (219, 124).
; PLAN: r0=403(x), r1=42(y), r2=103(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x), r6=168(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=219(x), r11=124(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 42
LDI r2, 103
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 168
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 219
LDI r11, 124
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
