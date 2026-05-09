; DESCRIPTION: Composite: Places a yellow 19x82 rectangle at position (244, 61) then Draws a black line from (171, 24) to (471, 181).
; PLAN: r0=244(x), r1=61(y), r2=19(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x1), r6=24(y1), r7=471(x2), r8=181(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 61
LDI r2, 19
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 24
LDI r7, 471
LDI r8, 181
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
