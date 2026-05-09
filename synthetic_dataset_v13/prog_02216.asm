; DESCRIPTION: Composite: Places a black 97x13 rectangle at position (322, 128) then Draws a red line from (21, 109) to (380, 32).
; PLAN: r0=322(x), r1=128(y), r2=97(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x1), r6=109(y1), r7=380(x2), r8=32(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 128
LDI r2, 97
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 109
LDI r7, 380
LDI r8, 32
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
