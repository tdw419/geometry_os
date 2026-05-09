; DESCRIPTION: Places a green 42x43 rectangle at position (39, 199).
; PLAN: r0=39(x), r1=199(y), r2=42(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 199
LDI r2, 42
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
