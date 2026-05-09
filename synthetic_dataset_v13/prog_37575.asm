; DESCRIPTION: Places a cyan 30x48 rectangle at position (164, 88).
; PLAN: r0=164(x), r1=88(y), r2=30(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 88
LDI r2, 30
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
