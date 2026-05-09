; DESCRIPTION: Places a magenta 14x90 rectangle at position (443, 118).
; PLAN: r0=443(x), r1=118(y), r2=14(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 118
LDI r2, 14
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
