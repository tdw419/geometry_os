; DESCRIPTION: Composite: Creates a red circular shape at (442, 135) with radius 60 then Places a magenta 104x115 rectangle at position (87, 51).
; PLAN: r0=442(x), r1=135(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=51(y), r7=104(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 135
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 51
LDI r7, 104
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
