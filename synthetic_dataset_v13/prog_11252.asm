; DESCRIPTION: Places a red 21x113 rectangle at position (407, 115).
; PLAN: r0=407(x), r1=115(y), r2=21(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 115
LDI r2, 21
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
