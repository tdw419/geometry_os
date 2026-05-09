; DESCRIPTION: Composite: Places a cyan dot at position (102, 23) then Renders a orange disk with center (215, 118) and radius 46 then Creates a white rectangular region at (367, 95) spanning 24 by 58 pixels.
; PLAN: r0=102(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=118(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=95(y), r12=24(width), r13=58(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 118
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 95
LDI r12, 24
LDI r13, 58
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
