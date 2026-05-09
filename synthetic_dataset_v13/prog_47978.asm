; DESCRIPTION: Composite: Places a yellow dot at position (131, 185) then Places a cyan 59x27 rectangle at position (334, 135).
; PLAN: r0=131(x), r1=185(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=135(y), r7=59(width), r8=27(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 185
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 334
LDI r6, 135
LDI r7, 59
LDI r8, 27
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
