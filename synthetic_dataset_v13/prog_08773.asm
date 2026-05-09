; DESCRIPTION: Places a green 120x106 rectangle at position (388, 30).
; PLAN: r0=388(x), r1=30(y), r2=120(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 30
LDI r2, 120
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
