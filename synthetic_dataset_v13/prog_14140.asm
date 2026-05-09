; DESCRIPTION: Places a red 37x24 rectangle at position (121, 71).
; PLAN: r0=121(x), r1=71(y), r2=37(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 71
LDI r2, 37
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
