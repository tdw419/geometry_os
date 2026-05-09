; DESCRIPTION: Composite: Sets a single black pixel at (66, 152) then Places a white 59x115 rectangle at position (297, 97).
; PLAN: r0=66(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=97(y), r7=59(width), r8=115(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 297
LDI r6, 97
LDI r7, 59
LDI r8, 115
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
