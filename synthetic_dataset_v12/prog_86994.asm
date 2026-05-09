; DESCRIPTION: Places a white 38x112 rectangle at position (368, 122).
; PLAN: r0=368(x), r1=122(y), r2=38(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 122
LDI r2, 38
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
