; DESCRIPTION: Places a yellow 32x30 rectangle at position (6, 12).
; PLAN: r0=6(x), r1=12(y), r2=32(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 12
LDI r2, 32
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
