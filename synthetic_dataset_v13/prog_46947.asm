; DESCRIPTION: Composite: Places a cyan dot at position (301, 67) then Draws a white rectangle at (342, 160) with width 33 and height 56.
; PLAN: r0=301(x), r1=67(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=160(y), r7=33(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 67
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 342
LDI r6, 160
LDI r7, 33
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
