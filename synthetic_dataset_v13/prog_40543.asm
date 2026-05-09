; DESCRIPTION: Composite: Creates a red rectangular region at (359, 23) spanning 111 by 70 pixels then Places a white dot at position (300, 206).
; PLAN: r0=359(x), r1=23(y), r2=111(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=206(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 359
LDI r1, 23
LDI r2, 111
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 206
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
