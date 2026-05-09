; DESCRIPTION: Places a cyan 84x112 rectangle at position (110, 121).
; PLAN: r0=110(x), r1=121(y), r2=84(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 121
LDI r2, 84
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
