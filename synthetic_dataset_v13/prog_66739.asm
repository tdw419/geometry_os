; DESCRIPTION: Composite: Renders a cyan disk with center (89, 112) and radius 56 then Creates a yellow rectangular region at (243, 25) spanning 24 by 57 pixels then Places a black dot at position (284, 17).
; PLAN: r0=89(x), r1=112(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=25(y), r7=24(width), r8=57(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=284(x), r11=17(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 89
LDI r1, 112
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 25
LDI r7, 24
LDI r8, 57
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 17
LDI r12, 0x000000
PSET r10, r11, r12
HALT
