; DESCRIPTION: Composite: Places a red dot at position (309, 246) then Places a cyan 50x31 rectangle at position (453, 96) then Creates a white circular shape at (365, 160) with radius 26.
; PLAN: r0=309(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=453(x), r6=96(y), r7=50(width), r8=31(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=160(y), r12=26(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 246
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 453
LDI r6, 96
LDI r7, 50
LDI r8, 31
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 160
LDI r12, 26
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
