; DESCRIPTION: Places a orange 92x82 rectangle at position (361, 92).
; PLAN: r0=361(x), r1=92(y), r2=92(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 92
LDI r2, 92
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
