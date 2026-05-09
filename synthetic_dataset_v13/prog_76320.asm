; DESCRIPTION: Composite: Places a black dot at position (176, 143) then Places a yellow 18x35 rectangle at position (59, 70).
; PLAN: r0=176(x), r1=143(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=70(y), r7=18(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 143
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 59
LDI r6, 70
LDI r7, 18
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
