; DESCRIPTION: Composite: Renders a orange box of size 58x80 starting at (21, 107) then Places a yellow dot at position (361, 235) then Places a cyan line segment connecting (382, 14) to (295, 239).
; PLAN: r0=21(x), r1=107(y), r2=58(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=235(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=382(x1), r11=14(y1), r12=295(x2), r13=239(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 21
LDI r1, 107
LDI r2, 58
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 235
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 382
LDI r11, 14
LDI r12, 295
LDI r13, 239
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
