; DESCRIPTION: Renders a green box of size 108x76 starting at (175, 164).
; PLAN: r0=175(x), r1=164(y), r2=108(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 164
LDI r2, 108
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
