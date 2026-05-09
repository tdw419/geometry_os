; DESCRIPTION: Composite: Creates a magenta rectangular region at (21, 160) spanning 117 by 80 pixels then Places a purple dot at position (197, 170).
; PLAN: r0=21(x), r1=160(y), r2=117(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=170(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 21
LDI r1, 160
LDI r2, 117
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 170
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
