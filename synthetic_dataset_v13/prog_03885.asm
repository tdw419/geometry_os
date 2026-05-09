; DESCRIPTION: Composite: Creates a white rectangular region at (114, 31) spanning 59 by 44 pixels then Sets a single cyan pixel at (73, 146).
; PLAN: r0=114(x), r1=31(y), r2=59(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=146(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 114
LDI r1, 31
LDI r2, 59
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 146
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
