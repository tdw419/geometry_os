; DESCRIPTION: Places a red 113x104 rectangle at position (27, 77).
; PLAN: r0=27(x), r1=77(y), r2=113(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 77
LDI r2, 113
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
