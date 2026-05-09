; DESCRIPTION: Places a magenta 85x26 rectangle at position (230, 146).
; PLAN: r0=230(x), r1=146(y), r2=85(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 146
LDI r2, 85
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
