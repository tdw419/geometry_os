; DESCRIPTION: Places a cyan 26x45 rectangle at position (129, 91).
; PLAN: r0=129(x), r1=91(y), r2=26(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 91
LDI r2, 26
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
