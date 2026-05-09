; DESCRIPTION: Composite: Sets a single orange pixel at (446, 239) then Draws a cyan rectangle at (368, 137) with width 96 and height 79 then Draws a white circle centered at (104, 59) with radius 59.
; PLAN: r0=446(x), r1=239(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=137(y), r7=96(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=59(y), r12=59(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 446
LDI r1, 239
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 368
LDI r6, 137
LDI r7, 96
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 59
LDI r12, 59
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
