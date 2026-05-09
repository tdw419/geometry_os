; DESCRIPTION: Composite: Places a black circle of radius 41 at center (134, 211) then Places a green dot at position (81, 220) then Renders a magenta box of size 61x76 starting at (326, 98).
; PLAN: r0=134(x), r1=211(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=220(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=326(x), r11=98(y), r12=61(width), r13=76(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 211
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 220
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 326
LDI r11, 98
LDI r12, 61
LDI r13, 76
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
