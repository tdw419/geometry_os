; DESCRIPTION: Composite: Draws a cyan line from (258, 221) to (263, 253) then Creates a green rectangular region at (85, 113) spanning 33 by 61 pixels then Places a yellow dot at position (304, 27).
; PLAN: r0=258(x1), r1=221(y1), r2=263(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=113(y), r7=33(width), r8=61(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=27(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 258
LDI r1, 221
LDI r2, 263
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 113
LDI r7, 33
LDI r8, 61
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 27
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
