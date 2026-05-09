; DESCRIPTION: Places a green 26x18 rectangle at position (446, 31).
; PLAN: r0=446(x), r1=31(y), r2=26(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 31
LDI r2, 26
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
