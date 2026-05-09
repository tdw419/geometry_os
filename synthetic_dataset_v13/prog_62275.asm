; DESCRIPTION: Renders a black box of size 40x77 starting at (370, 174).
; PLAN: r0=370(x), r1=174(y), r2=40(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 174
LDI r2, 40
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
