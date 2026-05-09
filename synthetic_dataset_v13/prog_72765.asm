; DESCRIPTION: Places a green 115x34 rectangle at position (115, 28).
; PLAN: r0=115(x), r1=28(y), r2=115(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 28
LDI r2, 115
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
