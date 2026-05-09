; DESCRIPTION: Composite: Renders a cyan disk with center (415, 117) and radius 77 then Draws a yellow rectangle at (149, 14) with width 73 and height 57.
; PLAN: r0=415(x), r1=117(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x), r6=14(y), r7=73(width), r8=57(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 117
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 14
LDI r7, 73
LDI r8, 57
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
