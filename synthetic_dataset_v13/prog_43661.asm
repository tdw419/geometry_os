; DESCRIPTION: Composite: Creates a orange rectangular region at (85, 215) spanning 62 by 15 pixels then Draws a cyan line from (266, 228) to (309, 184).
; PLAN: r0=85(x), r1=215(y), r2=62(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=228(y1), r7=309(x2), r8=184(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 215
LDI r2, 62
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 228
LDI r7, 309
LDI r8, 184
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
