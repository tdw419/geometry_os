; DESCRIPTION: Renders a blue box of size 47x26 starting at (214, 177).
; PLAN: r0=214(x), r1=177(y), r2=47(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 177
LDI r2, 47
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
