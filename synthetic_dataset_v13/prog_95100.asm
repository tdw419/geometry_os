; DESCRIPTION: Renders a green box of size 67x76 starting at (48, 80).
; PLAN: r0=48(x), r1=80(y), r2=67(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 80
LDI r2, 67
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
