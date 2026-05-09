; DESCRIPTION: Places a red 80x30 rectangle at position (233, 224).
; PLAN: r0=233(x), r1=224(y), r2=80(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 224
LDI r2, 80
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
