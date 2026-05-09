; DESCRIPTION: Renders a red box of size 27x49 starting at (296, 183).
; PLAN: r0=296(x), r1=183(y), r2=27(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 183
LDI r2, 27
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
