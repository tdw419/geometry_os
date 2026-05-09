; DESCRIPTION: Composite: Sets a single magenta pixel at (241, 53) then Places a magenta 55x62 rectangle at position (401, 160).
; PLAN: r0=241(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=160(y), r7=55(width), r8=62(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 160
LDI r7, 55
LDI r8, 62
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
