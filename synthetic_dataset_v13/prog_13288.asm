; DESCRIPTION: Renders a white box of size 91x40 starting at (370, 210).
; PLAN: r0=370(x), r1=210(y), r2=91(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 210
LDI r2, 91
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
