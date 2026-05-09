; DESCRIPTION: Composite: Creates a white circular shape at (277, 148) with radius 65 then Places a purple 54x42 rectangle at position (401, 162).
; PLAN: r0=277(x), r1=148(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=162(y), r7=54(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 148
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 162
LDI r7, 54
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
