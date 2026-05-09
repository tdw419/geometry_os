; DESCRIPTION: Renders a black box of size 47x14 starting at (410, 73).
; PLAN: r0=410(x), r1=73(y), r2=47(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 73
LDI r2, 47
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
