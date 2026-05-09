; DESCRIPTION: Places a magenta 116x26 rectangle at position (45, 221).
; PLAN: r0=45(x), r1=221(y), r2=116(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 221
LDI r2, 116
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
