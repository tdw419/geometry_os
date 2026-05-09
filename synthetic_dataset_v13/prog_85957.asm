; DESCRIPTION: Composite: Renders a black box of size 53x47 starting at (97, 57) then Places a orange circle of radius 21 at center (441, 142).
; PLAN: r0=97(x), r1=57(y), r2=53(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=142(y), r7=21(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 57
LDI r2, 53
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 142
LDI r7, 21
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
