; DESCRIPTION: Places a white 48x115 rectangle at position (375, 71).
; PLAN: r0=375(x), r1=71(y), r2=48(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 71
LDI r2, 48
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
