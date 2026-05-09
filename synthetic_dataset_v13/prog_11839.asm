; DESCRIPTION: Composite: Places a cyan dot at position (8, 12) then Places a white 100x32 rectangle at position (256, 120) then Places a orange circle of radius 25 at center (52, 127).
; PLAN: r0=8(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=120(y), r7=100(width), r8=32(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=52(x), r11=127(y), r12=25(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 8
LDI r1, 12
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 120
LDI r7, 100
LDI r8, 32
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 127
LDI r12, 25
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
