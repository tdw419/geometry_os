; DESCRIPTION: Renders a blue box of size 98x10 starting at (380, 243).
; PLAN: r0=380(x), r1=243(y), r2=98(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 243
LDI r2, 98
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
