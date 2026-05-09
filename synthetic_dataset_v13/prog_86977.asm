; DESCRIPTION: Places a red 111x90 rectangle at position (31, 106).
; PLAN: r0=31(x), r1=106(y), r2=111(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 106
LDI r2, 111
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
