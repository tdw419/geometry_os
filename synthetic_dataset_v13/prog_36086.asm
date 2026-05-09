; DESCRIPTION: Composite: Sets a single white pixel at (454, 230) then Draws a cyan rectangle at (149, 58) with width 54 and height 35.
; PLAN: r0=454(x), r1=230(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=58(y), r7=54(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 230
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 58
LDI r7, 54
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
