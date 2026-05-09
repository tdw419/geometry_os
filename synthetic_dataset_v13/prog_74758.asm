; DESCRIPTION: Places a red 18x17 rectangle at position (69, 143).
; PLAN: r0=69(x), r1=143(y), r2=18(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 143
LDI r2, 18
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
