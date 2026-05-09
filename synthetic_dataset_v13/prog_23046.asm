; DESCRIPTION: Composite: Places a green dot at position (189, 88) then Places a white 39x118 rectangle at position (249, 47).
; PLAN: r0=189(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=47(y), r7=39(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 249
LDI r6, 47
LDI r7, 39
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
