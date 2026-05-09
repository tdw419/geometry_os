; DESCRIPTION: Places a red 62x77 rectangle at position (364, 16).
; PLAN: r0=364(x), r1=16(y), r2=62(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 16
LDI r2, 62
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
