; DESCRIPTION: Places a magenta 26x91 rectangle at position (228, 71).
; PLAN: r0=228(x), r1=71(y), r2=26(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 71
LDI r2, 26
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
