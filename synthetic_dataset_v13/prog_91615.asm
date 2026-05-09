; DESCRIPTION: Places a cyan 26x102 rectangle at position (217, 72).
; PLAN: r0=217(x), r1=72(y), r2=26(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 72
LDI r2, 26
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
