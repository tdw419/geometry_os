; DESCRIPTION: Places a black 22x112 rectangle at position (353, 38).
; PLAN: r0=353(x), r1=38(y), r2=22(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 38
LDI r2, 22
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
