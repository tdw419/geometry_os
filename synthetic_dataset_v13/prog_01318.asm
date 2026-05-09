; DESCRIPTION: Places a red 55x104 rectangle at position (125, 58).
; PLAN: r0=125(x), r1=58(y), r2=55(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 58
LDI r2, 55
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
