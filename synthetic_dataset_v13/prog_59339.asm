; DESCRIPTION: Composite: Creates a yellow rectangular region at (398, 31) spanning 63 by 41 pixels then Places a white dot at position (350, 40).
; PLAN: r0=398(x), r1=31(y), r2=63(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=40(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 398
LDI r1, 31
LDI r2, 63
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 40
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
