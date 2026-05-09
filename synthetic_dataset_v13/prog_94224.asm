; DESCRIPTION: Composite: Places a red dot at position (418, 83) then Renders a red box of size 104x21 starting at (240, 93).
; PLAN: r0=418(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=93(y), r7=104(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 83
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 240
LDI r6, 93
LDI r7, 104
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
