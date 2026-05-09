; DESCRIPTION: Composite: Renders a yellow box of size 104x74 starting at (190, 162) then Places a black dot at position (355, 197).
; PLAN: r0=190(x), r1=162(y), r2=104(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=197(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 190
LDI r1, 162
LDI r2, 104
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 197
LDI r7, 0x000000
PSET r5, r6, r7
HALT
