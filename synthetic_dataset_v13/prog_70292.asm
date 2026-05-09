; DESCRIPTION: Composite: Places a orange circle of radius 27 at center (480, 129) then Renders a orange box of size 107x58 starting at (226, 93) then Places a black dot at position (225, 234).
; PLAN: r0=480(x), r1=129(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=93(y), r7=107(width), r8=58(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x), r11=234(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 480
LDI r1, 129
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 93
LDI r7, 107
LDI r8, 58
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 234
LDI r12, 0x000000
PSET r10, r11, r12
HALT
