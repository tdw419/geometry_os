; DESCRIPTION: Places a white 16x102 rectangle at position (182, 13).
; PLAN: r0=182(x), r1=13(y), r2=16(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 13
LDI r2, 16
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
