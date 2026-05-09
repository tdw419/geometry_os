; DESCRIPTION: Places a green 87x38 rectangle at position (19, 0).
; PLAN: r0=19(x), r1=0(y), r2=87(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 0
LDI r2, 87
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
