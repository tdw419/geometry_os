; DESCRIPTION: Composite: Renders a yellow box of size 113x61 starting at (85, 71) then Places a black dot at position (101, 192).
; PLAN: r0=85(x), r1=71(y), r2=113(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=192(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 71
LDI r2, 113
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 192
LDI r7, 0x000000
PSET r5, r6, r7
HALT
