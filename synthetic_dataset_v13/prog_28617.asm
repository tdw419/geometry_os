; DESCRIPTION: Composite: Places a black 21x106 rectangle at position (415, 44) then Renders a red disk with center (83, 140) and radius 48 then Places a black dot at position (405, 244).
; PLAN: r0=415(x), r1=44(y), r2=21(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=140(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=405(x), r11=244(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 415
LDI r1, 44
LDI r2, 21
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 140
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 405
LDI r11, 244
LDI r12, 0x000000
PSET r10, r11, r12
HALT
