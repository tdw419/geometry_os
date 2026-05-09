; DESCRIPTION: Composite: Places a orange 113x81 rectangle at position (184, 68) then Places a white circle of radius 16 at center (279, 70).
; PLAN: r0=184(x), r1=68(y), r2=113(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x), r6=70(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 68
LDI r2, 113
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 70
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
