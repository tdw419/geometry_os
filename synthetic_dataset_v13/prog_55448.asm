; DESCRIPTION: Composite: Creates a red rectangular region at (199, 33) spanning 13 by 55 pixels then Places a cyan dot at position (5, 51) then Places a red circle of radius 42 at center (314, 114).
; PLAN: r0=199(x), r1=33(y), r2=13(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x), r6=51(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=314(x), r11=114(y), r12=42(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 33
LDI r2, 13
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 51
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 314
LDI r11, 114
LDI r12, 42
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
