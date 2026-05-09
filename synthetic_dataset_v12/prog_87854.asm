; DESCRIPTION: Places a red 24x86 rectangle at position (324, 56).
; PLAN: r0=324(x), r1=56(y), r2=24(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 56
LDI r2, 24
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
