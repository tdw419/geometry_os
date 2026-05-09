; DESCRIPTION: Composite: Renders a magenta disk with center (150, 169) and radius 57 then Creates a red rectangular region at (349, 150) spanning 75 by 11 pixels then Places a cyan dot at position (330, 40).
; PLAN: r0=150(x), r1=169(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=150(y), r7=75(width), r8=11(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x), r11=40(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 150
LDI r1, 169
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 150
LDI r7, 75
LDI r8, 11
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 40
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
