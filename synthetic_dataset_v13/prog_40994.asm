; DESCRIPTION: Composite: Places a cyan 16x93 rectangle at position (222, 73) then Places a green dot at position (174, 95).
; PLAN: r0=222(x), r1=73(y), r2=16(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=95(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 73
LDI r2, 16
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 95
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
