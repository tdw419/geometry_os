; DESCRIPTION: Composite: Draws a purple circle centered at (279, 188) with radius 67 then Places a white 50x46 rectangle at position (206, 36) then Sets a single black pixel at (231, 42).
; PLAN: r0=279(x), r1=188(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=36(y), r7=50(width), r8=46(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=231(x), r11=42(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 188
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 36
LDI r7, 50
LDI r8, 46
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 42
LDI r12, 0x000000
PSET r10, r11, r12
HALT
