; DESCRIPTION: Composite: Draws a cyan circle centered at (310, 143) with radius 47 then Places a cyan dot at position (323, 211) then Renders a cyan box of size 106x29 starting at (260, 192).
; PLAN: r0=310(x), r1=143(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=211(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=260(x), r11=192(y), r12=106(width), r13=29(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 143
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 211
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 260
LDI r11, 192
LDI r12, 106
LDI r13, 29
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
