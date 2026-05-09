; DESCRIPTION: Composite: Sets a single magenta pixel at (165, 127) then Places a blue 53x61 rectangle at position (418, 111) then Renders a green disk with center (335, 65) and radius 28.
; PLAN: r0=165(x), r1=127(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=111(y), r7=53(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x), r11=65(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 127
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 418
LDI r6, 111
LDI r7, 53
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 65
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
