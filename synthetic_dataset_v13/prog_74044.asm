; DESCRIPTION: Places a red 90x46 rectangle at position (72, 165).
; PLAN: r0=72(x), r1=165(y), r2=90(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 165
LDI r2, 90
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
