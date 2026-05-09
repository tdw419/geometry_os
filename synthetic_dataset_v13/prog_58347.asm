; DESCRIPTION: Places a white 70x30 rectangle at position (147, 167).
; PLAN: r0=147(x), r1=167(y), r2=70(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 167
LDI r2, 70
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
