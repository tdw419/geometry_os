; DESCRIPTION: Composite: Renders a orange box of size 40x117 starting at (43, 36) then Sets a single red pixel at (368, 81).
; PLAN: r0=43(x), r1=36(y), r2=40(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=81(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 36
LDI r2, 40
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 81
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
