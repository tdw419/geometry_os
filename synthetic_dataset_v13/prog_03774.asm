; DESCRIPTION: Renders a white box of size 27x10 starting at (238, 50).
; PLAN: r0=238(x), r1=50(y), r2=27(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 50
LDI r2, 27
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
