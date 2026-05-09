; DESCRIPTION: Composite: Renders a cyan box of size 44x71 starting at (179, 65) then Places a white dot at position (360, 128).
; PLAN: r0=179(x), r1=65(y), r2=44(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=128(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 65
LDI r2, 44
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 128
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
