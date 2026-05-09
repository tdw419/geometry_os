; DESCRIPTION: Places a cyan 32x117 rectangle at position (420, 67).
; PLAN: r0=420(x), r1=67(y), r2=32(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 67
LDI r2, 32
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
