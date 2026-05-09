; DESCRIPTION: Composite: Places a cyan dot at position (215, 153) then Draws a orange rectangle at (332, 34) with width 113 and height 73 then Places a green circle of radius 60 at center (102, 119).
; PLAN: r0=215(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=34(y), r7=113(width), r8=73(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=119(y), r12=60(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 153
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 34
LDI r7, 113
LDI r8, 73
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 119
LDI r12, 60
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
