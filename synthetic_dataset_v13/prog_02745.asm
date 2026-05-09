; DESCRIPTION: Places a white 73x107 rectangle at position (147, 27).
; PLAN: r0=147(x), r1=27(y), r2=73(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 27
LDI r2, 73
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
