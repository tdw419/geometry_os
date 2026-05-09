; DESCRIPTION: Renders a red box of size 42x117 starting at (198, 4).
; PLAN: r0=198(x), r1=4(y), r2=42(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 4
LDI r2, 42
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
