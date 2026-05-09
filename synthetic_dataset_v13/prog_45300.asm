; DESCRIPTION: Composite: Renders a white disk with center (309, 137) and radius 28 then Renders a black box of size 95x93 starting at (81, 65) then Sets a single magenta pixel at (217, 86).
; PLAN: r0=309(x), r1=137(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=65(y), r7=95(width), r8=93(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=217(x), r11=86(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 137
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 65
LDI r7, 95
LDI r8, 93
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 217
LDI r11, 86
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
