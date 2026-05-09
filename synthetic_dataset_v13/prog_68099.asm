; DESCRIPTION: Places a magenta 96x39 rectangle at position (309, 52).
; PLAN: r0=309(x), r1=52(y), r2=96(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 52
LDI r2, 96
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
