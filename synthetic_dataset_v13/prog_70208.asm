; DESCRIPTION: Renders a black box of size 80x68 starting at (243, 164).
; PLAN: r0=243(x), r1=164(y), r2=80(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 164
LDI r2, 80
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
