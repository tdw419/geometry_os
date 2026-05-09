; DESCRIPTION: Composite: Sets a single green pixel at (44, 181) then Places a yellow 27x24 rectangle at position (68, 67).
; PLAN: r0=44(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=67(y), r7=27(width), r8=24(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 181
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 68
LDI r6, 67
LDI r7, 27
LDI r8, 24
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
