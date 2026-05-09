; DESCRIPTION: Renders a black box of size 99x120 starting at (401, 104).
; PLAN: r0=401(x), r1=104(y), r2=99(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 104
LDI r2, 99
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
