; DESCRIPTION: Places a green 95x82 rectangle at position (24, 170).
; PLAN: r0=24(x), r1=170(y), r2=95(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 170
LDI r2, 95
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
