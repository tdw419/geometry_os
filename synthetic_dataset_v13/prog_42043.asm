; DESCRIPTION: Places a cyan 98x24 rectangle at position (55, 219).
; PLAN: r0=55(x), r1=219(y), r2=98(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 219
LDI r2, 98
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
