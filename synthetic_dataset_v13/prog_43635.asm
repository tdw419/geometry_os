; DESCRIPTION: Places a cyan 26x46 rectangle at position (345, 49).
; PLAN: r0=345(x), r1=49(y), r2=26(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 49
LDI r2, 26
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
