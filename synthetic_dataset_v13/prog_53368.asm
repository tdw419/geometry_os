; DESCRIPTION: Places a yellow 59x92 rectangle at position (171, 101).
; PLAN: r0=171(x), r1=101(y), r2=59(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 101
LDI r2, 59
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
