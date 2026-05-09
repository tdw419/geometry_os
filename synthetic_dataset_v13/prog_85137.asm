; DESCRIPTION: Composite: Sets a single white pixel at (386, 91) then Creates a purple circular shape at (335, 97) with radius 80 then Places a cyan 67x98 rectangle at position (242, 107).
; PLAN: r0=386(x), r1=91(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=97(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x), r11=107(y), r12=67(width), r13=98(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 91
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 97
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 107
LDI r12, 67
LDI r13, 98
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
