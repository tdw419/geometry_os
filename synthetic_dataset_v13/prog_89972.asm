; DESCRIPTION: Composite: Creates a red rectangular region at (409, 16) spanning 101 by 111 pixels then Places a white dot at position (59, 207).
; PLAN: r0=409(x), r1=16(y), r2=101(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=207(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 16
LDI r2, 101
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 207
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
