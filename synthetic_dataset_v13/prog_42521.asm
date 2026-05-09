; DESCRIPTION: Places a green 95x102 rectangle at position (338, 62).
; PLAN: r0=338(x), r1=62(y), r2=95(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 62
LDI r2, 95
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
