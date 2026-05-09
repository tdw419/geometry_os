; DESCRIPTION: Places a red 74x27 rectangle at position (44, 50).
; PLAN: r0=44(x), r1=50(y), r2=74(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 50
LDI r2, 74
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
