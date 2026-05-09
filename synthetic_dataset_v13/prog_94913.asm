; DESCRIPTION: Composite: Places a magenta dot at position (92, 207) then Places a purple 16x102 rectangle at position (223, 135).
; PLAN: r0=92(x), r1=207(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=135(y), r7=16(width), r8=102(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 207
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 135
LDI r7, 16
LDI r8, 102
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
