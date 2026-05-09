; DESCRIPTION: Places a green 40x114 rectangle at position (70, 27).
; PLAN: r0=70(x), r1=27(y), r2=40(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 27
LDI r2, 40
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
