; DESCRIPTION: Composite: Renders a cyan box of size 45x40 starting at (22, 19) then Places a yellow dot at position (129, 73).
; PLAN: r0=22(x), r1=19(y), r2=45(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=73(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 19
LDI r2, 45
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 73
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
