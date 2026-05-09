; DESCRIPTION: Places a cyan 77x62 rectangle at position (33, 189).
; PLAN: r0=33(x), r1=189(y), r2=77(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 189
LDI r2, 77
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
