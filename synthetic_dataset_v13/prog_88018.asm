; DESCRIPTION: Places a green 40x24 rectangle at position (187, 56).
; PLAN: r0=187(x), r1=56(y), r2=40(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 56
LDI r2, 40
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
