; DESCRIPTION: Composite: Places a magenta 69x92 rectangle at position (442, 16) then Renders a cyan disk with center (435, 154) and radius 63 then Sets a single white pixel at (209, 146).
; PLAN: r0=442(x), r1=16(y), r2=69(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=154(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x), r11=146(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 442
LDI r1, 16
LDI r2, 69
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 154
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 146
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
