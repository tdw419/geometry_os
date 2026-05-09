; DESCRIPTION: Composite: Renders a magenta disk with center (80, 59) and radius 26 then Places a red 64x65 rectangle at position (426, 26) then Places a white dot at position (37, 79).
; PLAN: r0=80(x), r1=59(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=26(y), r7=64(width), r8=65(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=37(x), r11=79(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 59
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 26
LDI r7, 64
LDI r8, 65
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 79
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
