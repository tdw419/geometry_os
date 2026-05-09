; DESCRIPTION: Composite: Renders a purple box of size 119x31 starting at (294, 162) then Places a red dot at position (446, 128).
; PLAN: r0=294(x), r1=162(y), r2=119(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=128(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 162
LDI r2, 119
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 128
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
