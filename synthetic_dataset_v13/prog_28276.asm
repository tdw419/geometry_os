; DESCRIPTION: Places a red 67x17 rectangle at position (380, 33).
; PLAN: r0=380(x), r1=33(y), r2=67(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 33
LDI r2, 67
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
