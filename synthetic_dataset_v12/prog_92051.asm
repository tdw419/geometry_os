; DESCRIPTION: Places a red 14x57 rectangle at position (253, 71).
; PLAN: r0=253(x), r1=71(y), r2=14(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 71
LDI r2, 14
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
