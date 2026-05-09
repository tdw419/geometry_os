; DESCRIPTION: Places a cyan 100x95 rectangle at position (160, 4).
; PLAN: r0=160(x), r1=4(y), r2=100(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 4
LDI r2, 100
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
