; DESCRIPTION: Places a white 55x27 rectangle at position (153, 127).
; PLAN: r0=153(x), r1=127(y), r2=55(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 127
LDI r2, 55
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
