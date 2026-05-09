; DESCRIPTION: Composite: Sets a single green pixel at (288, 70) then Places a purple 14x98 rectangle at position (178, 83).
; PLAN: r0=288(x), r1=70(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=83(y), r7=14(width), r8=98(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 70
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 178
LDI r6, 83
LDI r7, 14
LDI r8, 98
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
