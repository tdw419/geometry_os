; DESCRIPTION: Composite: Places a magenta dot at position (254, 177) then Places a blue 117x98 rectangle at position (174, 151).
; PLAN: r0=254(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=151(y), r7=117(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 177
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 151
LDI r7, 117
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
