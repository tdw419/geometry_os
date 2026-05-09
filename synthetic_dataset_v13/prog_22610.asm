; DESCRIPTION: Composite: Renders a black box of size 77x61 starting at (48, 8) then Places a yellow dot at position (281, 93).
; PLAN: r0=48(x), r1=8(y), r2=77(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=93(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 48
LDI r1, 8
LDI r2, 77
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 93
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
