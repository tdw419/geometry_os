; DESCRIPTION: Composite: Sets a single magenta pixel at (474, 160) then Draws a yellow rectangle at (379, 95) with width 103 and height 33.
; PLAN: r0=474(x), r1=160(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=95(y), r7=103(width), r8=33(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 474
LDI r1, 160
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 95
LDI r7, 103
LDI r8, 33
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
