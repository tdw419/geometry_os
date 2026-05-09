; DESCRIPTION: Renders a yellow box of size 13x15 starting at (410, 164).
; PLAN: r0=410(x), r1=164(y), r2=13(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 164
LDI r2, 13
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
