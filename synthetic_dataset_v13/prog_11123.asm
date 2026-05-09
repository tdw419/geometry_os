; DESCRIPTION: Composite: Creates a yellow rectangular region at (134, 41) spanning 120 by 38 pixels then Places a red dot at position (297, 1).
; PLAN: r0=134(x), r1=41(y), r2=120(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=1(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 41
LDI r2, 120
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 1
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
