; DESCRIPTION: Composite: Creates a red circular shape at (232, 51) with radius 50 then Creates a yellow rectangular region at (61, 177) spanning 86 by 70 pixels.
; PLAN: r0=232(x), r1=51(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=177(y), r7=86(width), r8=70(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 51
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 177
LDI r7, 86
LDI r8, 70
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
