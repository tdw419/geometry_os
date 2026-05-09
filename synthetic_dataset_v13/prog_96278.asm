; DESCRIPTION: Renders a yellow box of size 42x82 starting at (245, 31).
; PLAN: r0=245(x), r1=31(y), r2=42(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 31
LDI r2, 42
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
