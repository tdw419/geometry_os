; DESCRIPTION: Places a red 107x63 rectangle at position (279, 100).
; PLAN: r0=279(x), r1=100(y), r2=107(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 100
LDI r2, 107
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
