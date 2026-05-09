; DESCRIPTION: Composite: Places a purple dot at position (455, 87) then Renders a white disk with center (50, 147) and radius 10 then Renders a cyan box of size 24x109 starting at (245, 6).
; PLAN: r0=455(x), r1=87(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=147(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x), r11=6(y), r12=24(width), r13=109(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 87
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 50
LDI r6, 147
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 6
LDI r12, 24
LDI r13, 109
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
