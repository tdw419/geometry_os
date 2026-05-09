; DESCRIPTION: Composite: Creates a magenta rectangular region at (72, 116) spanning 88 by 95 pixels then Places a purple dot at position (387, 80).
; PLAN: r0=72(x), r1=116(y), r2=88(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=80(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 116
LDI r2, 88
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 80
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
