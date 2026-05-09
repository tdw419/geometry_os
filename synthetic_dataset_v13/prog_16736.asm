; DESCRIPTION: Places a red 107x30 rectangle at position (249, 12).
; PLAN: r0=249(x), r1=12(y), r2=107(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 12
LDI r2, 107
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
