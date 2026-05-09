; DESCRIPTION: Places a cyan 38x46 rectangle at position (325, 138).
; PLAN: r0=325(x), r1=138(y), r2=38(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 138
LDI r2, 38
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
