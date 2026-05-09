; DESCRIPTION: Composite: Draws a black line from (343, 143) to (502, 154) then Places a orange 89x13 rectangle at position (336, 128).
; PLAN: r0=343(x1), r1=143(y1), r2=502(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=128(y), r7=89(width), r8=13(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 143
LDI r2, 502
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 128
LDI r7, 89
LDI r8, 13
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
