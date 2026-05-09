; DESCRIPTION: Places a cyan 59x102 rectangle at position (171, 88).
; PLAN: r0=171(x), r1=88(y), r2=59(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 88
LDI r2, 59
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
