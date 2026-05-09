; DESCRIPTION: Places a cyan 112x36 rectangle at position (353, 41).
; PLAN: r0=353(x), r1=41(y), r2=112(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 41
LDI r2, 112
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
