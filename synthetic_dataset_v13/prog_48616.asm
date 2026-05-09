; DESCRIPTION: Places a red 42x37 rectangle at position (213, 138).
; PLAN: r0=213(x), r1=138(y), r2=42(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 138
LDI r2, 42
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
