; DESCRIPTION: Places a blue 112x41 rectangle at position (143, 192).
; PLAN: r0=143(x), r1=192(y), r2=112(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 192
LDI r2, 112
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
