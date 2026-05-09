; DESCRIPTION: Renders a yellow box of size 32x80 starting at (187, 42).
; PLAN: r0=187(x), r1=42(y), r2=32(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 42
LDI r2, 32
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
