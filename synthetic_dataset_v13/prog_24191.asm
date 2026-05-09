; DESCRIPTION: Composite: Places a green 78x105 rectangle at position (414, 28) then Creates a red circular shape at (270, 114) with radius 51 then Places a cyan dot at position (48, 253).
; PLAN: r0=414(x), r1=28(y), r2=78(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=114(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x), r11=253(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 28
LDI r2, 78
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 114
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 253
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
