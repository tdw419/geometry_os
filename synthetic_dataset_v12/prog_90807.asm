; DESCRIPTION: Places a red 120x28 rectangle at position (346, 15).
; PLAN: r0=346(x), r1=15(y), r2=120(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 15
LDI r2, 120
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
