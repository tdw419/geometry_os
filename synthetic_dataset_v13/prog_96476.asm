; DESCRIPTION: Composite: Creates a red rectangular region at (432, 163) spanning 59 by 59 pixels then Sets a single cyan pixel at (280, 170).
; PLAN: r0=432(x), r1=163(y), r2=59(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=170(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 163
LDI r2, 59
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 170
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
