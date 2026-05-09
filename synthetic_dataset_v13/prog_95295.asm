; DESCRIPTION: Composite: Places a yellow 117x35 rectangle at position (96, 207) then Places a black dot at position (154, 48).
; PLAN: r0=96(x), r1=207(y), r2=117(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=48(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 207
LDI r2, 117
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 48
LDI r7, 0x000000
PSET r5, r6, r7
HALT
