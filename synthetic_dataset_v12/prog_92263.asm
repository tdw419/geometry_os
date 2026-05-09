; DESCRIPTION: Places a red 51x60 rectangle at position (156, 140).
; PLAN: r0=156(x), r1=140(y), r2=51(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 140
LDI r2, 51
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
