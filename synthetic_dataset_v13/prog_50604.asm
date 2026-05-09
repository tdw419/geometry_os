; DESCRIPTION: Places a red 62x54 rectangle at position (125, 153).
; PLAN: r0=125(x), r1=153(y), r2=62(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 153
LDI r2, 62
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
