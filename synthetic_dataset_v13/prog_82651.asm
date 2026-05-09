; DESCRIPTION: Composite: Sets a single magenta pixel at (91, 214) then Places a green 92x41 rectangle at position (338, 153).
; PLAN: r0=91(x), r1=214(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=153(y), r7=92(width), r8=41(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 214
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 338
LDI r6, 153
LDI r7, 92
LDI r8, 41
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
