; DESCRIPTION: Composite: Creates a orange rectangular region at (410, 210) spanning 37 by 41 pixels then Places a green dot at position (478, 169).
; PLAN: r0=410(x), r1=210(y), r2=37(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=169(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 410
LDI r1, 210
LDI r2, 37
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 169
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
