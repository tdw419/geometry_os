; DESCRIPTION: Places a white 101x55 rectangle at position (57, 50).
; PLAN: r0=57(x), r1=50(y), r2=101(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 50
LDI r2, 101
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
