; DESCRIPTION: Renders a white box of size 42x26 starting at (146, 11).
; PLAN: r0=146(x), r1=11(y), r2=42(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 11
LDI r2, 42
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
