; DESCRIPTION: Places a green 107x15 rectangle at position (184, 124).
; PLAN: r0=184(x), r1=124(y), r2=107(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 124
LDI r2, 107
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
