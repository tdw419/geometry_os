; DESCRIPTION: Composite: Draws a cyan circle centered at (51, 88) with radius 21 then Places a cyan 41x51 rectangle at position (167, 169).
; PLAN: r0=51(x), r1=88(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=169(y), r7=41(width), r8=51(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 88
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 169
LDI r7, 41
LDI r8, 51
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
