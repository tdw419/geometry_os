; DESCRIPTION: Places a magenta 118x15 rectangle at position (272, 143).
; PLAN: r0=272(x), r1=143(y), r2=118(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 143
LDI r2, 118
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
