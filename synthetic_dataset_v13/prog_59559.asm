; DESCRIPTION: Composite: Creates a purple circular shape at (457, 91) with radius 52 then Places a purple 92x52 rectangle at position (176, 146).
; PLAN: r0=457(x), r1=91(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=146(y), r7=92(width), r8=52(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 457
LDI r1, 91
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 146
LDI r7, 92
LDI r8, 52
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
