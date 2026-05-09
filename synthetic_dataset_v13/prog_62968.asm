; DESCRIPTION: Places a black 46x40 rectangle at position (327, 44).
; PLAN: r0=327(x), r1=44(y), r2=46(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 44
LDI r2, 46
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
