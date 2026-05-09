; DESCRIPTION: Composite: Creates a white circular shape at (253, 103) with radius 39 then Renders a red box of size 120x85 starting at (328, 134) then Places a black dot at position (12, 192).
; PLAN: r0=253(x), r1=103(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=134(y), r7=120(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=12(x), r11=192(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 253
LDI r1, 103
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 134
LDI r7, 120
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 192
LDI r12, 0x000000
PSET r10, r11, r12
HALT
