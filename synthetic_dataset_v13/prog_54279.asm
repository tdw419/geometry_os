; DESCRIPTION: Composite: Places a red dot at position (415, 68) then Places a green 106x12 rectangle at position (203, 173) then Renders a cyan disk with center (309, 147) and radius 61.
; PLAN: r0=415(x), r1=68(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=173(y), r7=106(width), r8=12(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x), r11=147(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 415
LDI r1, 68
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 203
LDI r6, 173
LDI r7, 106
LDI r8, 12
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 147
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
