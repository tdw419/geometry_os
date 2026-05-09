; DESCRIPTION: Composite: Draws a cyan circle centered at (302, 166) with radius 27 then Places a cyan line segment connecting (50, 15) to (488, 187).
; PLAN: r0=302(x), r1=166(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x1), r6=15(y1), r7=488(x2), r8=187(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 166
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 15
LDI r7, 488
LDI r8, 187
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
