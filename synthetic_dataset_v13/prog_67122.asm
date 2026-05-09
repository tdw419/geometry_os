; DESCRIPTION: Composite: Places a orange dot at position (371, 10) then Places a orange 95x78 rectangle at position (307, 25) then Renders a orange disk with center (412, 144) and radius 46.
; PLAN: r0=371(x), r1=10(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=25(y), r7=95(width), r8=78(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x), r11=144(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 10
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 307
LDI r6, 25
LDI r7, 95
LDI r8, 78
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 144
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
