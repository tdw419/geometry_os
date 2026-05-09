; DESCRIPTION: Composite: Places a purple dot at position (472, 148) then Places a red 73x59 rectangle at position (45, 37).
; PLAN: r0=472(x), r1=148(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=37(y), r7=73(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 148
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 37
LDI r7, 73
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
