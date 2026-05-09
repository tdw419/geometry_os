; DESCRIPTION: Places a orange 66x48 rectangle at position (146, 158).
; PLAN: r0=146(x), r1=158(y), r2=66(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 158
LDI r2, 66
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
