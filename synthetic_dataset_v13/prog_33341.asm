; DESCRIPTION: Composite: Places a white dot at position (353, 115) then Places a blue 54x116 rectangle at position (383, 105).
; PLAN: r0=353(x), r1=115(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=105(y), r7=54(width), r8=116(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 115
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 383
LDI r6, 105
LDI r7, 54
LDI r8, 116
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
