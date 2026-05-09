; DESCRIPTION: Composite: Sets a single cyan pixel at (273, 59) then Creates a green circular shape at (410, 178) with radius 66 then Renders a orange box of size 93x51 starting at (250, 5).
; PLAN: r0=273(x), r1=59(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=178(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x), r11=5(y), r12=93(width), r13=51(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 59
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 410
LDI r6, 178
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 5
LDI r12, 93
LDI r13, 51
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
