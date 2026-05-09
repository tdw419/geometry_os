; DESCRIPTION: Composite: Places a blue dot at position (415, 49) then Creates a cyan rectangular region at (262, 228) spanning 56 by 21 pixels then Renders a red disk with center (309, 62) and radius 61.
; PLAN: r0=415(x), r1=49(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=228(y), r7=56(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x), r11=62(y), r12=61(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 415
LDI r1, 49
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 228
LDI r7, 56
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 62
LDI r12, 61
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
