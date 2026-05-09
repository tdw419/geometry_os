; DESCRIPTION: Composite: Creates a purple rectangular region at (225, 96) spanning 73 by 108 pixels then Places a green dot at position (117, 111).
; PLAN: r0=225(x), r1=96(y), r2=73(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=111(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 96
LDI r2, 73
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 111
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
