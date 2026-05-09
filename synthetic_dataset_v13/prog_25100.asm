; DESCRIPTION: Renders a yellow box of size 115x50 starting at (365, 76).
; PLAN: r0=365(x), r1=76(y), r2=115(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 76
LDI r2, 115
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
