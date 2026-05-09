; DESCRIPTION: Places a cyan 12x29 rectangle at position (246, 217).
; PLAN: r0=246(x), r1=217(y), r2=12(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 217
LDI r2, 12
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
