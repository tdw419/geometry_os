; DESCRIPTION: Composite: Renders a yellow box of size 38x103 starting at (117, 19) then Places a cyan dot at position (355, 164).
; PLAN: r0=117(x), r1=19(y), r2=38(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=164(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 117
LDI r1, 19
LDI r2, 38
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 164
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
