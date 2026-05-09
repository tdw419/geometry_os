; DESCRIPTION: Places a magenta 83x90 rectangle at position (272, 93).
; PLAN: r0=272(x), r1=93(y), r2=83(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 93
LDI r2, 83
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
