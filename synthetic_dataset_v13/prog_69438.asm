; DESCRIPTION: Renders a red box of size 63x42 starting at (365, 73).
; PLAN: r0=365(x), r1=73(y), r2=63(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 73
LDI r2, 63
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
