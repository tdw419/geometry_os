; DESCRIPTION: Places a cyan 26x109 rectangle at position (333, 141).
; PLAN: r0=333(x), r1=141(y), r2=26(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 141
LDI r2, 26
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
