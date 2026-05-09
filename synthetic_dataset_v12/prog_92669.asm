; DESCRIPTION: Places a white 79x36 rectangle at position (247, 173).
; PLAN: r0=247(x), r1=173(y), r2=79(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 173
LDI r2, 79
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
