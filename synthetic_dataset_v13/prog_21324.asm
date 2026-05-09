; DESCRIPTION: Places a cyan 95x12 rectangle at position (222, 74).
; PLAN: r0=222(x), r1=74(y), r2=95(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 74
LDI r2, 95
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
