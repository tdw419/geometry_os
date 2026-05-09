; DESCRIPTION: Renders a red box of size 30x103 starting at (411, 79).
; PLAN: r0=411(x), r1=79(y), r2=30(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 79
LDI r2, 30
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
