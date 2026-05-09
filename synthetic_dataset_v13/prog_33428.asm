; DESCRIPTION: Places a red 84x103 rectangle at position (217, 60).
; PLAN: r0=217(x), r1=60(y), r2=84(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 60
LDI r2, 84
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
