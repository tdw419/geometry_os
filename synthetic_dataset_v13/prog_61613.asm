; DESCRIPTION: Places a magenta 19x86 rectangle at position (332, 121).
; PLAN: r0=332(x), r1=121(y), r2=19(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 121
LDI r2, 19
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
