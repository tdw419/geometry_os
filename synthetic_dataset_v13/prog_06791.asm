; DESCRIPTION: Places a cyan 33x102 rectangle at position (292, 88).
; PLAN: r0=292(x), r1=88(y), r2=33(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 88
LDI r2, 33
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
