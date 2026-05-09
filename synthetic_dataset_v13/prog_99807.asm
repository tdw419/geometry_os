; DESCRIPTION: Composite: Creates a yellow rectangular region at (146, 208) spanning 68 by 46 pixels then Places a magenta dot at position (276, 38).
; PLAN: r0=146(x), r1=208(y), r2=68(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=38(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 208
LDI r2, 68
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 38
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
