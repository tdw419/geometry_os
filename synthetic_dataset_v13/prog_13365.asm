; DESCRIPTION: Renders a white box of size 73x103 starting at (305, 135).
; PLAN: r0=305(x), r1=135(y), r2=73(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 135
LDI r2, 73
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
