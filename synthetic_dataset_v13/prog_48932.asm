; DESCRIPTION: Composite: Renders a black box of size 104x88 starting at (34, 31) then Sets a single orange pixel at (39, 143).
; PLAN: r0=34(x), r1=31(y), r2=104(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x), r6=143(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 31
LDI r2, 104
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 143
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
