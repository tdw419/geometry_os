; DESCRIPTION: Composite: Renders a orange disk with center (223, 116) and radius 52 then Renders a magenta box of size 21x32 starting at (32, 53) then Sets a single white pixel at (34, 44).
; PLAN: r0=223(x), r1=116(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=53(y), r7=21(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x), r11=44(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 116
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 53
LDI r7, 21
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 44
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
