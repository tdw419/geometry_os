; DESCRIPTION: Renders a white box of size 50x26 starting at (42, 143).
; PLAN: r0=42(x), r1=143(y), r2=50(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 143
LDI r2, 50
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
