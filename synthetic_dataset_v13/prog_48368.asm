; DESCRIPTION: Composite: Renders a yellow box of size 104x75 starting at (231, 132) then Places a cyan dot at position (72, 83).
; PLAN: r0=231(x), r1=132(y), r2=104(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=83(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 231
LDI r1, 132
LDI r2, 104
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 83
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
