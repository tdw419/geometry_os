; DESCRIPTION: Places a red 93x98 rectangle at position (140, 84).
; PLAN: r0=140(x), r1=84(y), r2=93(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 84
LDI r2, 93
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
