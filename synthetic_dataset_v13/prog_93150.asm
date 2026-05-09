; DESCRIPTION: Places a red 43x107 rectangle at position (111, 8).
; PLAN: r0=111(x), r1=8(y), r2=43(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 8
LDI r2, 43
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
