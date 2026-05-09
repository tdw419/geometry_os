; DESCRIPTION: Places a black 114x91 rectangle at position (65, 38).
; PLAN: r0=65(x), r1=38(y), r2=114(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 38
LDI r2, 114
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
