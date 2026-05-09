; DESCRIPTION: Composite: Places a yellow 10x62 rectangle at position (325, 116) then Places a black dot at position (333, 219).
; PLAN: r0=325(x), r1=116(y), r2=10(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x), r6=219(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 116
LDI r2, 10
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 219
LDI r7, 0x000000
PSET r5, r6, r7
HALT
