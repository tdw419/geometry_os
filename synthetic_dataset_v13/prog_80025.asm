; DESCRIPTION: Composite: Renders a green box of size 56x44 starting at (445, 12) then Places a white dot at position (101, 23) then Renders a cyan disk with center (206, 158) and radius 64.
; PLAN: r0=445(x), r1=12(y), r2=56(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=23(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=158(y), r12=64(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 445
LDI r1, 12
LDI r2, 56
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 23
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 206
LDI r11, 158
LDI r12, 64
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
