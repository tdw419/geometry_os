; DESCRIPTION: Renders a red box of size 13x42 starting at (107, 89).
; PLAN: r0=107(x), r1=89(y), r2=13(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 89
LDI r2, 13
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
