; DESCRIPTION: Places a red 30x75 rectangle at position (209, 0).
; PLAN: r0=209(x), r1=0(y), r2=30(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 0
LDI r2, 30
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
