; DESCRIPTION: Composite: Places a white dot at position (325, 121) then Places a green 34x17 rectangle at position (345, 34).
; PLAN: r0=325(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=34(y), r7=34(width), r8=17(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 34
LDI r7, 34
LDI r8, 17
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
