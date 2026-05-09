; DESCRIPTION: Composite: Sets a single red pixel at (3, 67) then Places a yellow 83x57 rectangle at position (175, 165).
; PLAN: r0=3(x), r1=67(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=165(y), r7=83(width), r8=57(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 67
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 175
LDI r6, 165
LDI r7, 83
LDI r8, 57
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
