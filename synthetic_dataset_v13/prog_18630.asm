; DESCRIPTION: Places a white 92x103 rectangle at position (150, 20).
; PLAN: r0=150(x), r1=20(y), r2=92(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 20
LDI r2, 92
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
