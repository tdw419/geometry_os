; DESCRIPTION: Renders a red box of size 19x32 starting at (475, 215).
; PLAN: r0=475(x), r1=215(y), r2=19(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 215
LDI r2, 19
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
