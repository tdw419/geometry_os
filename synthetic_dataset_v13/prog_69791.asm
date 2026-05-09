; DESCRIPTION: Places a cyan 34x20 rectangle at position (59, 181).
; PLAN: r0=59(x), r1=181(y), r2=34(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 181
LDI r2, 34
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
