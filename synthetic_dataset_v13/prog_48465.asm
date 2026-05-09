; DESCRIPTION: Renders a red box of size 95x107 starting at (79, 32).
; PLAN: r0=79(x), r1=32(y), r2=95(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 32
LDI r2, 95
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
