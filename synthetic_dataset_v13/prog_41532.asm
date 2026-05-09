; DESCRIPTION: Renders a white box of size 34x15 starting at (305, 40).
; PLAN: r0=305(x), r1=40(y), r2=34(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 40
LDI r2, 34
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
