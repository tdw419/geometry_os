; DESCRIPTION: Places a yellow 50x68 rectangle at position (81, 116).
; PLAN: r0=81(x), r1=116(y), r2=50(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 116
LDI r2, 50
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
