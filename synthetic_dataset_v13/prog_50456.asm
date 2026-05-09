; DESCRIPTION: Renders a yellow box of size 119x66 starting at (367, 42).
; PLAN: r0=367(x), r1=42(y), r2=119(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 42
LDI r2, 119
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
