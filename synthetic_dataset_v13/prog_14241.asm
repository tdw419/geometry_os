; DESCRIPTION: Composite: Places a orange circle of radius 33 at center (392, 71) then Creates a orange rectangular region at (20, 96) spanning 33 by 81 pixels then Places a orange dot at position (215, 135).
; PLAN: r0=392(x), r1=71(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=96(y), r7=33(width), r8=81(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x), r11=135(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 71
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 96
LDI r7, 33
LDI r8, 81
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 135
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
