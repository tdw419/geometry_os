; DESCRIPTION: Composite: Creates a orange rectangular region at (249, 159) spanning 47 by 54 pixels then Places a magenta dot at position (229, 54).
; PLAN: r0=249(x), r1=159(y), r2=47(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=54(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 159
LDI r2, 47
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 54
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
