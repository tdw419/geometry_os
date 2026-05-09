; DESCRIPTION: Composite: Renders a blue box of size 95x45 starting at (269, 31) then Places a red dot at position (394, 73).
; PLAN: r0=269(x), r1=31(y), r2=95(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x), r6=73(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 269
LDI r1, 31
LDI r2, 95
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 73
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
