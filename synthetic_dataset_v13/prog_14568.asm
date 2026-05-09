; DESCRIPTION: Places a magenta 56x107 rectangle at position (386, 118).
; PLAN: r0=386(x), r1=118(y), r2=56(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 118
LDI r2, 56
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
