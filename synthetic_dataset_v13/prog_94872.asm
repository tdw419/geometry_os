; DESCRIPTION: Draws a red rectangle at (241, 190) with width 27 and height 46.
; PLAN: r0=241(x), r1=190(y), r2=27(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 190
LDI r2, 27
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
