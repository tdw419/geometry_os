; DESCRIPTION: Composite: Creates a black rectangular region at (346, 41) spanning 55 by 115 pixels then Places a cyan dot at position (233, 212).
; PLAN: r0=346(x), r1=41(y), r2=55(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=212(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 41
LDI r2, 55
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 212
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
