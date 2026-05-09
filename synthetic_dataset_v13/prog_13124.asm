; DESCRIPTION: Places a cyan 102x88 rectangle at position (135, 40).
; PLAN: r0=135(x), r1=40(y), r2=102(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 40
LDI r2, 102
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
