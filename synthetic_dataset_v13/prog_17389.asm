; DESCRIPTION: Composite: Creates a yellow rectangular region at (382, 55) spanning 12 by 19 pixels then Places a cyan circle of radius 32 at center (303, 210) then Places a magenta dot at position (84, 195).
; PLAN: r0=382(x), r1=55(y), r2=12(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=210(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x), r11=195(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 55
LDI r2, 12
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 210
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 195
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
