; DESCRIPTION: Places a white 95x55 rectangle at position (160, 127).
; PLAN: r0=160(x), r1=127(y), r2=95(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 127
LDI r2, 95
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
