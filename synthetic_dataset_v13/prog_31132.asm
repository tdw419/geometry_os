; DESCRIPTION: Places a red 109x91 rectangle at position (217, 5).
; PLAN: r0=217(x), r1=5(y), r2=109(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 5
LDI r2, 109
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
