; DESCRIPTION: Places a green 29x91 rectangle at position (384, 106).
; PLAN: r0=384(x), r1=106(y), r2=29(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 106
LDI r2, 29
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
