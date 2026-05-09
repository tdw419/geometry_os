; DESCRIPTION: Composite: Sets a single yellow pixel at (258, 88) then Creates a blue rectangular region at (53, 146) spanning 50 by 55 pixels.
; PLAN: r0=258(x), r1=88(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=146(y), r7=50(width), r8=55(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 88
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 53
LDI r6, 146
LDI r7, 50
LDI r8, 55
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
