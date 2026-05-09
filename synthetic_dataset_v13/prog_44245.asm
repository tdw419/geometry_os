; DESCRIPTION: Places a red 50x26 rectangle at position (157, 226).
; PLAN: r0=157(x), r1=226(y), r2=50(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 226
LDI r2, 50
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
