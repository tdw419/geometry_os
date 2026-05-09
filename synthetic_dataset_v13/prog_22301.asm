; DESCRIPTION: Places a cyan 84x97 rectangle at position (296, 1).
; PLAN: r0=296(x), r1=1(y), r2=84(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 1
LDI r2, 84
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
