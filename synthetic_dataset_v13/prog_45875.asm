; DESCRIPTION: Composite: Creates a magenta rectangular region at (69, 171) spanning 12 by 46 pixels then Places a magenta dot at position (371, 42).
; PLAN: r0=69(x), r1=171(y), r2=12(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=42(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 69
LDI r1, 171
LDI r2, 12
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 42
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
