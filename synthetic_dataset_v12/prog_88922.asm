; DESCRIPTION: Composite: Places a blue dot at position (86, 138) then Renders a orange box of size 21x83 starting at (450, 104) then Renders a red disk with center (107, 146) and radius 78.
; PLAN: r0=86(x), r1=138(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=104(y), r7=21(width), r8=83(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x), r11=146(y), r12=78(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 138
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 450
LDI r6, 104
LDI r7, 21
LDI r8, 83
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 146
LDI r12, 78
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
