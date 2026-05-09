; DESCRIPTION: Composite: Creates a magenta rectangular region at (201, 18) spanning 28 by 40 pixels then Places a black circle of radius 45 at center (244, 134) then Places a magenta dot at position (443, 57).
; PLAN: r0=201(x), r1=18(y), r2=28(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=134(y), r7=45(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=443(x), r11=57(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 18
LDI r2, 28
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 134
LDI r7, 45
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 443
LDI r11, 57
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
