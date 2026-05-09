; DESCRIPTION: Renders a yellow box of size 42x41 starting at (332, 214).
; PLAN: r0=332(x), r1=214(y), r2=42(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 214
LDI r2, 42
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
