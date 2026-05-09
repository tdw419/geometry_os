; DESCRIPTION: Places a yellow 100x32 rectangle at position (116, 197).
; PLAN: r0=116(x), r1=197(y), r2=100(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 197
LDI r2, 100
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
