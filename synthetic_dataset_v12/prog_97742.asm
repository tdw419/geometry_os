; DESCRIPTION: Composite: Draws a red line from (12, 87) to (240, 64) then Places a black 34x23 rectangle at position (477, 181).
; PLAN: r0=12(x1), r1=87(y1), r2=240(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=181(y), r7=34(width), r8=23(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 12
LDI r1, 87
LDI r2, 240
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 181
LDI r7, 34
LDI r8, 23
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
