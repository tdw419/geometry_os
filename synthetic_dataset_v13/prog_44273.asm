; DESCRIPTION: Composite: Draws a cyan line from (97, 138) to (349, 52) then Places a yellow 42x33 rectangle at position (226, 116).
; PLAN: r0=97(x1), r1=138(y1), r2=349(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=116(y), r7=42(width), r8=33(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 138
LDI r2, 349
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 116
LDI r7, 42
LDI r8, 33
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
