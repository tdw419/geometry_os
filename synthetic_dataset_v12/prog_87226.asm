; DESCRIPTION: Places a white 73x36 rectangle at position (364, 95).
; PLAN: r0=364(x), r1=95(y), r2=73(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 95
LDI r2, 73
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
