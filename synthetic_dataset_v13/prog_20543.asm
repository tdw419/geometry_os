; DESCRIPTION: Renders a green box of size 94x77 starting at (67, 7).
; PLAN: r0=67(x), r1=7(y), r2=94(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 7
LDI r2, 94
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
