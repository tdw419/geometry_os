; DESCRIPTION: Places a yellow 100x61 rectangle at position (153, 169).
; PLAN: r0=153(x), r1=169(y), r2=100(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 169
LDI r2, 100
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
