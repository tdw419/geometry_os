; DESCRIPTION: Places a red 36x90 rectangle at position (411, 56).
; PLAN: r0=411(x), r1=56(y), r2=36(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 56
LDI r2, 36
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
