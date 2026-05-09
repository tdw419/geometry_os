; DESCRIPTION: Places a cyan 10x100 rectangle at position (442, 13).
; PLAN: r0=442(x), r1=13(y), r2=10(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 13
LDI r2, 10
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
