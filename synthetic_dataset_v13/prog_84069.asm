; DESCRIPTION: Composite: Places a red 102x104 rectangle at position (42, 152) then Places a red dot at position (170, 17).
; PLAN: r0=42(x), r1=152(y), r2=102(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=17(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 152
LDI r2, 102
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 17
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
