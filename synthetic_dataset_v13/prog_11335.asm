; DESCRIPTION: Composite: Sets a single cyan pixel at (71, 249) then Draws a magenta circle centered at (357, 95) with radius 53 then Places a red 54x27 rectangle at position (186, 36).
; PLAN: r0=71(x), r1=249(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=95(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x), r11=36(y), r12=54(width), r13=27(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 249
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 95
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 36
LDI r12, 54
LDI r13, 27
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
