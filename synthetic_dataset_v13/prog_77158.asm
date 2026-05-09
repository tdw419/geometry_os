; DESCRIPTION: Places a cyan 71x35 rectangle at position (88, 209).
; PLAN: r0=88(x), r1=209(y), r2=71(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 209
LDI r2, 71
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
