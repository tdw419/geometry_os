; DESCRIPTION: Places a cyan 46x31 rectangle at position (144, 121).
; PLAN: r0=144(x), r1=121(y), r2=46(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 121
LDI r2, 46
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
