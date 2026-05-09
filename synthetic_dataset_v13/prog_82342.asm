; DESCRIPTION: Renders a red box of size 75x32 starting at (401, 27).
; PLAN: r0=401(x), r1=27(y), r2=75(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 27
LDI r2, 75
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
