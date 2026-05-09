; DESCRIPTION: Places a red 55x36 rectangle at position (107, 159).
; PLAN: r0=107(x), r1=159(y), r2=55(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 159
LDI r2, 55
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
