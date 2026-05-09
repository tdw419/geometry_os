; DESCRIPTION: Places a red 70x106 rectangle at position (405, 128).
; PLAN: r0=405(x), r1=128(y), r2=70(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 128
LDI r2, 70
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
