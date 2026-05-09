; DESCRIPTION: Places a green 28x38 rectangle at position (87, 100).
; PLAN: r0=87(x), r1=100(y), r2=28(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 100
LDI r2, 28
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
