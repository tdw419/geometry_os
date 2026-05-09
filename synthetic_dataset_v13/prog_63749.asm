; DESCRIPTION: Composite: Places a cyan dot at position (43, 1) then Places a cyan line segment connecting (90, 224) to (327, 241) then Places a white 60x17 rectangle at position (33, 142).
; PLAN: r0=43(x), r1=1(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=90(x1), r6=224(y1), r7=327(x2), r8=241(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=142(y), r12=60(width), r13=17(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 224
LDI r7, 327
LDI r8, 241
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 142
LDI r12, 60
LDI r13, 17
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
