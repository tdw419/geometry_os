; DESCRIPTION: Places a magenta 100x24 rectangle at position (202, 54).
; PLAN: r0=202(x), r1=54(y), r2=100(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 54
LDI r2, 100
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
