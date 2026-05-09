; DESCRIPTION: Places a white 96x22 rectangle at position (292, 127).
; PLAN: r0=292(x), r1=127(y), r2=96(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 127
LDI r2, 96
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
