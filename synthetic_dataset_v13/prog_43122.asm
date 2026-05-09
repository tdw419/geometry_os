; DESCRIPTION: Composite: Renders a green box of size 113x71 starting at (14, 171) then Creates a cyan circular shape at (225, 169) with radius 80 then Places a red dot at position (278, 132).
; PLAN: r0=14(x), r1=171(y), r2=113(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=169(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=278(x), r11=132(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 171
LDI r2, 113
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 169
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 278
LDI r11, 132
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
