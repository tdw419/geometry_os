; DESCRIPTION: Places a red 69x46 rectangle at position (43, 156).
; PLAN: r0=43(x), r1=156(y), r2=69(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 156
LDI r2, 69
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
