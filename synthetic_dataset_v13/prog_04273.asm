; DESCRIPTION: Renders a black box of size 67x48 starting at (187, 180).
; PLAN: r0=187(x), r1=180(y), r2=67(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 180
LDI r2, 67
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
