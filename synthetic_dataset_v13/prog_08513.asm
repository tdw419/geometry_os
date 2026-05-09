; DESCRIPTION: Places a cyan 72x88 rectangle at position (32, 17).
; PLAN: r0=32(x), r1=17(y), r2=72(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 17
LDI r2, 72
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
