; DESCRIPTION: Composite: Places a cyan dot at position (237, 6) then Places a magenta 77x46 rectangle at position (188, 77).
; PLAN: r0=237(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=77(y), r7=77(width), r8=46(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 188
LDI r6, 77
LDI r7, 77
LDI r8, 46
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
