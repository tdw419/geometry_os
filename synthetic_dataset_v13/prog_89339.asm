; DESCRIPTION: Composite: Sets a single magenta pixel at (274, 149) then Renders a orange box of size 65x69 starting at (49, 25).
; PLAN: r0=274(x), r1=149(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=25(y), r7=65(width), r8=69(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 149
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 25
LDI r7, 65
LDI r8, 69
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
