; DESCRIPTION: Composite: Places a green 87x17 rectangle at position (387, 233) then Places a red dot at position (86, 205).
; PLAN: r0=387(x), r1=233(y), r2=87(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=205(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 233
LDI r2, 87
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 205
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
