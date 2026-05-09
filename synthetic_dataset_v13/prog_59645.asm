; DESCRIPTION: Places a magenta 34x39 rectangle at position (153, 21).
; PLAN: r0=153(x), r1=21(y), r2=34(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 21
LDI r2, 34
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
