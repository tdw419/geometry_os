; DESCRIPTION: Composite: Renders a black line between points (351, 67) and (108, 254) then Places a white 107x32 rectangle at position (10, 71).
; PLAN: r0=351(x1), r1=67(y1), r2=108(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=71(y), r7=107(width), r8=32(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 67
LDI r2, 108
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 71
LDI r7, 107
LDI r8, 32
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
