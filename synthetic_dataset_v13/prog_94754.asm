; DESCRIPTION: Renders a black box of size 67x110 starting at (410, 34).
; PLAN: r0=410(x), r1=34(y), r2=67(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 34
LDI r2, 67
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
