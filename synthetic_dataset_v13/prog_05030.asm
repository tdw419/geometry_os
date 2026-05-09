; DESCRIPTION: Places a purple 104x43 rectangle at position (290, 166).
; PLAN: r0=290(x), r1=166(y), r2=104(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 166
LDI r2, 104
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
