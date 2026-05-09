; DESCRIPTION: Places a white 26x30 rectangle at position (226, 54).
; PLAN: r0=226(x), r1=54(y), r2=26(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 54
LDI r2, 26
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
