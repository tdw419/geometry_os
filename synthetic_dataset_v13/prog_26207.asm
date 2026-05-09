; DESCRIPTION: Places a red 50x98 rectangle at position (259, 127).
; PLAN: r0=259(x), r1=127(y), r2=50(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 127
LDI r2, 50
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
