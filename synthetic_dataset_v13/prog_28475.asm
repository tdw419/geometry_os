; DESCRIPTION: Composite: Sets a single yellow pixel at (263, 195) then Draws a yellow rectangle at (236, 79) with width 46 and height 88.
; PLAN: r0=263(x), r1=195(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=79(y), r7=46(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 195
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 236
LDI r6, 79
LDI r7, 46
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
