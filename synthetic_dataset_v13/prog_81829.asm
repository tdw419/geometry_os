; DESCRIPTION: Composite: Places a orange 39x99 rectangle at position (190, 123) then Places a red dot at position (405, 189) then Renders a magenta disk with center (456, 41) and radius 30.
; PLAN: r0=190(x), r1=123(y), r2=39(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=189(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=456(x), r11=41(y), r12=30(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 123
LDI r2, 39
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 189
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 456
LDI r11, 41
LDI r12, 30
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
