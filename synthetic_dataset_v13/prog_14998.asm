; DESCRIPTION: Renders a white box of size 117x64 starting at (254, 50).
; PLAN: r0=254(x), r1=50(y), r2=117(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 50
LDI r2, 117
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
