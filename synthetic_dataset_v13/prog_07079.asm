; DESCRIPTION: Composite: Places a white dot at position (184, 31) then Places a magenta 66x29 rectangle at position (152, 203).
; PLAN: r0=184(x), r1=31(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=203(y), r7=66(width), r8=29(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 31
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 203
LDI r7, 66
LDI r8, 29
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
