; DESCRIPTION: Composite: Places a green 119x45 rectangle at position (48, 111) then Places a orange dot at position (238, 41).
; PLAN: r0=48(x), r1=111(y), r2=119(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=41(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 48
LDI r1, 111
LDI r2, 119
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 41
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
