; DESCRIPTION: Renders a white box of size 85x42 starting at (262, 165).
; PLAN: r0=262(x), r1=165(y), r2=85(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 165
LDI r2, 85
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
