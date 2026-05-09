; DESCRIPTION: Places a yellow 66x27 rectangle at position (333, 62).
; PLAN: r0=333(x), r1=62(y), r2=66(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 62
LDI r2, 66
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
