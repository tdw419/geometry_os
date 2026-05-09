; DESCRIPTION: Composite: Places a black 33x95 rectangle at position (206, 64) then Sets a single black pixel at (328, 221).
; PLAN: r0=206(x), r1=64(y), r2=33(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=221(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 206
LDI r1, 64
LDI r2, 33
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 221
LDI r7, 0x000000
PSET r5, r6, r7
HALT
