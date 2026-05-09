; DESCRIPTION: Composite: Places a white dot at position (242, 18) then Places a white 14x77 rectangle at position (328, 134) then Creates a red circular shape at (173, 115) with radius 42.
; PLAN: r0=242(x), r1=18(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=134(y), r7=14(width), r8=77(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x), r11=115(y), r12=42(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 18
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 134
LDI r7, 14
LDI r8, 77
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 115
LDI r12, 42
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
