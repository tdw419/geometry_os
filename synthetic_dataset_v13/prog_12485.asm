; DESCRIPTION: Composite: Creates a black rectangular region at (70, 46) spanning 88 by 90 pixels then Sets a single orange pixel at (384, 99).
; PLAN: r0=70(x), r1=46(y), r2=88(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=99(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 70
LDI r1, 46
LDI r2, 88
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 99
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
