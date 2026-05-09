; DESCRIPTION: Composite: Places a black dot at position (372, 247) then Places a blue 40x83 rectangle at position (426, 168).
; PLAN: r0=372(x), r1=247(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=168(y), r7=40(width), r8=83(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 247
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 426
LDI r6, 168
LDI r7, 40
LDI r8, 83
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
