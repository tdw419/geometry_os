; DESCRIPTION: Composite: Renders a purple box of size 70x102 starting at (169, 55) then Places a green dot at position (477, 88).
; PLAN: r0=169(x), r1=55(y), r2=70(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=477(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 55
LDI r2, 70
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
