; DESCRIPTION: Places a red 28x68 rectangle at position (217, 1).
; PLAN: r0=217(x), r1=1(y), r2=28(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 1
LDI r2, 28
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
