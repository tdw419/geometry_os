; DESCRIPTION: Composite: Renders a green disk with center (250, 55) and radius 44 then Places a white 43x50 rectangle at position (176, 13).
; PLAN: r0=250(x), r1=55(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=13(y), r7=43(width), r8=50(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 55
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 13
LDI r7, 43
LDI r8, 50
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
