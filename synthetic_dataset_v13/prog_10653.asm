; DESCRIPTION: Places a cyan 78x34 rectangle at position (238, 153).
; PLAN: r0=238(x), r1=153(y), r2=78(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 153
LDI r2, 78
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
