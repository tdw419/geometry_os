; DESCRIPTION: Renders a black box of size 40x47 starting at (210, 16).
; PLAN: r0=210(x), r1=16(y), r2=40(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 16
LDI r2, 40
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
