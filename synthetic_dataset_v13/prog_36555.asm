; DESCRIPTION: Composite: Creates a orange circular shape at (365, 86) with radius 21 then Places a magenta 85x95 rectangle at position (279, 61) then Places a magenta dot at position (281, 36).
; PLAN: r0=365(x), r1=86(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=61(y), r7=85(width), r8=95(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x), r11=36(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 86
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 61
LDI r7, 85
LDI r8, 95
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 36
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
