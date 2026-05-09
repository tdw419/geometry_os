; DESCRIPTION: Places a red 39x78 rectangle at position (445, 93).
; PLAN: r0=445(x), r1=93(y), r2=39(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 93
LDI r2, 39
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
