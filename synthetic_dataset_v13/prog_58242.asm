; DESCRIPTION: Places a blue 38x14 rectangle at position (384, 41).
; PLAN: r0=384(x), r1=41(y), r2=38(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 41
LDI r2, 38
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
