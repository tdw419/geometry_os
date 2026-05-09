; DESCRIPTION: Composite: Places a cyan dot at position (205, 255) then Places a white 56x116 rectangle at position (326, 129).
; PLAN: r0=205(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=129(y), r7=56(width), r8=116(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 129
LDI r7, 56
LDI r8, 116
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
