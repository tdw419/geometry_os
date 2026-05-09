; DESCRIPTION: Composite: Draws a yellow rectangle at (171, 73) with width 76 and height 22 then Places a red dot at position (82, 187).
; PLAN: r0=171(x), r1=73(y), r2=76(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=187(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 73
LDI r2, 76
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 187
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
