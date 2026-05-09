; DESCRIPTION: Places a green 38x28 rectangle at position (256, 170).
; PLAN: r0=256(x), r1=170(y), r2=38(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 170
LDI r2, 38
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
