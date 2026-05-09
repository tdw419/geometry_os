; DESCRIPTION: Composite: Places a cyan dot at position (14, 148) then Renders a green disk with center (190, 129) and radius 49 then Places a purple 21x46 rectangle at position (61, 105).
; PLAN: r0=14(x), r1=148(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=129(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=61(x), r11=105(y), r12=21(width), r13=46(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 148
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 190
LDI r6, 129
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 61
LDI r11, 105
LDI r12, 21
LDI r13, 46
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
