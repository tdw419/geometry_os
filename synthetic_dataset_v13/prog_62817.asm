; DESCRIPTION: Places a white 76x111 rectangle at position (247, 79).
; PLAN: r0=247(x), r1=79(y), r2=76(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 79
LDI r2, 76
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
