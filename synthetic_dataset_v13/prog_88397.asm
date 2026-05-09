; DESCRIPTION: Composite: Renders a cyan box of size 104x106 starting at (302, 101) then Places a white dot at position (200, 118).
; PLAN: r0=302(x), r1=101(y), r2=104(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=118(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 302
LDI r1, 101
LDI r2, 104
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 118
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
