; DESCRIPTION: Places a cyan 29x26 rectangle at position (48, 2).
; PLAN: r0=48(x), r1=2(y), r2=29(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 2
LDI r2, 29
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
