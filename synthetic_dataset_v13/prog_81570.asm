; DESCRIPTION: Places a green 39x83 rectangle at position (421, 28).
; PLAN: r0=421(x), r1=28(y), r2=39(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 28
LDI r2, 39
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
