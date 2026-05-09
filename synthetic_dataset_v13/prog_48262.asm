; DESCRIPTION: Places a orange 115x111 rectangle at position (65, 133).
; PLAN: r0=65(x), r1=133(y), r2=115(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 133
LDI r2, 115
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
