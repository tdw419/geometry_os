; DESCRIPTION: Places a magenta 26x74 rectangle at position (208, 65).
; PLAN: r0=208(x), r1=65(y), r2=26(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 65
LDI r2, 26
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
