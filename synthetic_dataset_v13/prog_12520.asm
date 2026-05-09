; DESCRIPTION: Composite: Renders a yellow box of size 74x39 starting at (308, 61) then Places a green dot at position (44, 233) then Creates a cyan circular shape at (240, 186) with radius 28.
; PLAN: r0=308(x), r1=61(y), r2=74(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x), r6=233(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=240(x), r11=186(y), r12=28(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 61
LDI r2, 74
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 233
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 240
LDI r11, 186
LDI r12, 28
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
