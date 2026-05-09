; DESCRIPTION: Places a white 99x40 rectangle at position (309, 3).
; PLAN: r0=309(x), r1=3(y), r2=99(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 3
LDI r2, 99
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
