; DESCRIPTION: Places a cyan 76x92 rectangle at position (252, 48).
; PLAN: r0=252(x), r1=48(y), r2=76(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 48
LDI r2, 76
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
