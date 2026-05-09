; DESCRIPTION: Composite: Creates a yellow rectangular region at (337, 77) spanning 75 by 41 pixels then Places a cyan circle of radius 19 at center (211, 207).
; PLAN: r0=337(x), r1=77(y), r2=75(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=207(y), r7=19(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 77
LDI r2, 75
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 207
LDI r7, 19
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
