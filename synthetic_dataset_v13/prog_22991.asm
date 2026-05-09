; DESCRIPTION: Composite: Draws a red rectangle at (7, 93) with width 102 and height 60 then Places a yellow dot at position (420, 182).
; PLAN: r0=7(x), r1=93(y), r2=102(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=182(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 93
LDI r2, 102
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 182
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
