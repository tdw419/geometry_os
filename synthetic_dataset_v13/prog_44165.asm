; DESCRIPTION: Places a green 101x113 rectangle at position (37, 27).
; PLAN: r0=37(x), r1=27(y), r2=101(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 27
LDI r2, 101
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
