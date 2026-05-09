; DESCRIPTION: Places a green 24x81 rectangle at position (482, 45).
; PLAN: r0=482(x), r1=45(y), r2=24(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 45
LDI r2, 24
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
