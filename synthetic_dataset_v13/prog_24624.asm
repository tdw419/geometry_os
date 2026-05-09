; DESCRIPTION: Places a red 90x84 rectangle at position (227, 146).
; PLAN: r0=227(x), r1=146(y), r2=90(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 146
LDI r2, 90
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
