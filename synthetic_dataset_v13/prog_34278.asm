; DESCRIPTION: Places a white 16x82 rectangle at position (486, 133).
; PLAN: r0=486(x), r1=133(y), r2=16(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 133
LDI r2, 16
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
