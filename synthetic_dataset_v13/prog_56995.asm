; DESCRIPTION: Renders a red box of size 29x47 starting at (365, 128).
; PLAN: r0=365(x), r1=128(y), r2=29(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 128
LDI r2, 29
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
