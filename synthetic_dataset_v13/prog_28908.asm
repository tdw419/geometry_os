; DESCRIPTION: Composite: Renders a purple box of size 102x100 starting at (120, 28) then Places a cyan dot at position (144, 129).
; PLAN: r0=120(x), r1=28(y), r2=102(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=129(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 28
LDI r2, 102
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 129
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
