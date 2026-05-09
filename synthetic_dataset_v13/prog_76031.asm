; DESCRIPTION: Renders a black box of size 42x13 starting at (446, 200).
; PLAN: r0=446(x), r1=200(y), r2=42(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 200
LDI r2, 42
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
