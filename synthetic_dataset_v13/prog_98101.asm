; DESCRIPTION: Places a magenta 66x35 rectangle at position (107, 146).
; PLAN: r0=107(x), r1=146(y), r2=66(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 146
LDI r2, 66
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
