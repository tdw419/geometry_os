; DESCRIPTION: Places a red 47x34 rectangle at position (108, 92).
; PLAN: r0=108(x), r1=92(y), r2=47(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 92
LDI r2, 47
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
