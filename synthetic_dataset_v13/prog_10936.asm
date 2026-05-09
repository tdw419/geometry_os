; DESCRIPTION: Places a cyan 20x60 rectangle at position (469, 0).
; PLAN: r0=469(x), r1=0(y), r2=20(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 0
LDI r2, 20
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
