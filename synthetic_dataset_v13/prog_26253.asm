; DESCRIPTION: Places a red 77x65 rectangle at position (174, 69).
; PLAN: r0=174(x), r1=69(y), r2=77(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 69
LDI r2, 77
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
