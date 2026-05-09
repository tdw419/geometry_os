; DESCRIPTION: Places a cyan 119x84 rectangle at position (284, 72).
; PLAN: r0=284(x), r1=72(y), r2=119(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 72
LDI r2, 119
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
