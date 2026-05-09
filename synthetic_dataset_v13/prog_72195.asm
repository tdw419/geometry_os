; DESCRIPTION: Places a magenta 49x86 rectangle at position (228, 114).
; PLAN: r0=228(x), r1=114(y), r2=49(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 114
LDI r2, 49
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
