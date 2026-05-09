; DESCRIPTION: Places a red 72x93 rectangle at position (251, 130).
; PLAN: r0=251(x), r1=130(y), r2=72(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 130
LDI r2, 72
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
