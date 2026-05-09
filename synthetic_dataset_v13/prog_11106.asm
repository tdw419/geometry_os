; DESCRIPTION: Composite: Sets a single white pixel at (107, 138) then Places a purple 108x111 rectangle at position (181, 46).
; PLAN: r0=107(x), r1=138(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=46(y), r7=108(width), r8=111(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 138
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 46
LDI r7, 108
LDI r8, 111
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
