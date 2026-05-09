; DESCRIPTION: Composite: Places a orange dot at position (401, 149) then Draws a green rectangle at (111, 200) with width 33 and height 33.
; PLAN: r0=401(x), r1=149(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=200(y), r7=33(width), r8=33(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 149
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 111
LDI r6, 200
LDI r7, 33
LDI r8, 33
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
