; DESCRIPTION: Composite: Places a yellow 37x21 rectangle at position (169, 79) then Places a black circle of radius 71 at center (317, 75).
; PLAN: r0=169(x), r1=79(y), r2=37(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=75(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 169
LDI r1, 79
LDI r2, 37
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 75
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
