; DESCRIPTION: Composite: Places a orange circle of radius 74 at center (200, 93) then Places a orange 42x86 rectangle at position (55, 1).
; PLAN: r0=200(x), r1=93(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=1(y), r7=42(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 93
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 1
LDI r7, 42
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
