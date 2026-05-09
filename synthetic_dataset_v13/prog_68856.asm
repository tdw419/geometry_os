; DESCRIPTION: Composite: Renders a red box of size 11x41 starting at (92, 109) then Places a cyan dot at position (48, 27).
; PLAN: r0=92(x), r1=109(y), r2=11(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=27(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 92
LDI r1, 109
LDI r2, 11
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 27
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
