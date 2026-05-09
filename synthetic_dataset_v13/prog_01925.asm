; DESCRIPTION: Places a cyan 33x90 rectangle at position (339, 34).
; PLAN: r0=339(x), r1=34(y), r2=33(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 34
LDI r2, 33
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
