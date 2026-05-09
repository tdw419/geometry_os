; DESCRIPTION: Composite: Sets a single magenta pixel at (349, 166) then Creates a green rectangular region at (230, 171) spanning 69 by 55 pixels.
; PLAN: r0=349(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=171(y), r7=69(width), r8=55(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 166
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 171
LDI r7, 69
LDI r8, 55
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
