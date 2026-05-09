; DESCRIPTION: Renders a green box of size 38x10 starting at (443, 239).
; PLAN: r0=443(x), r1=239(y), r2=38(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 239
LDI r2, 38
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
