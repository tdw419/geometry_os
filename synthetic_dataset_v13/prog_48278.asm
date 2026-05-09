; DESCRIPTION: Composite: Places a red 61x90 rectangle at position (445, 67) then Creates a green circular shape at (233, 131) with radius 72.
; PLAN: r0=445(x), r1=67(y), r2=61(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=131(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 67
LDI r2, 61
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 131
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
