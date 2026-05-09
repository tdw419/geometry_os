; DESCRIPTION: Composite: Places a red circle of radius 57 at center (212, 160) then Places a white dot at position (109, 47) then Creates a cyan rectangular region at (213, 184) spanning 42 by 14 pixels.
; PLAN: r0=212(x), r1=160(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=47(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=213(x), r11=184(y), r12=42(width), r13=14(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 160
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 47
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 213
LDI r11, 184
LDI r12, 42
LDI r13, 14
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
